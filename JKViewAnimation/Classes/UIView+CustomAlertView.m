//
//  UIView+CustomAlertView.m
//  CustomAnimation
//
//  Created by ning on 2017/4/17.
//  Copyright © 2017年 songjk. All rights reserved.
//

#import "UIView+CustomAlertView.h"
//#import <objc/runtime.h>

#define ALPHA  0.2 //背景
#define AlertTime 0.3 //弹出动画时间
#define DropTime 0.5 //落下动画时间
#define ShareTime 0.3//分享时间


@implementation UIView (CustomAlertView)

static JKCustomAnimationMode mode;
static CGFloat  bgAlpha;
static BOOL isNeedEffective;

static UIView *supView;
static CGFloat animationTime;
/*
 - (void)setBgAlpha:(CGFloat)bgAlpha{
 objc_setAssociatedObject(self, BGALPHA, @(bgAlpha), OBJC_ASSOCIATION_ASSIGN);
 }
 - (CGFloat)bgAlpha{
 return [objc_getAssociatedObject(self, @"bgAlpha") floatValue];
 }
 */

-(void)jk_showInWindowWithMode:(JKCustomAnimationMode)animationMode inView:(UIView *)superV bgAlpha:(CGFloat)alpha needEffectView:(BOOL)isNeed{
    mode = animationMode;
    bgAlpha = alpha;
    isNeedEffective = isNeed;
    supView = superV;
    animationTime = [self getAnimationTimeWithMode:animationMode];
    [self keyBoardListen];
    switch (animationMode) {
        case JKCustomAnimationModeAlert:
            [self showInWindow];
            break;
        case JKCustomAnimationModeDrop:
            [self upToDownShowInWindow];
            break;
        case JKCustomAnimationModeShare:
            [self shareViewShowInWindow];
            break;
            
        case JKCustomAnimationModeNone:
            [self showViewWithOutAnimation];
            break;
        default:
            break;
    }
}



-(void)tapBgView{
    switch (mode) {
        case JKCustomAnimationModeAlert:
            [self hide];
            break;
        case JKCustomAnimationModeDrop:
            [self dropDown];
            break;
        case JKCustomAnimationModeShare:
            [self hideShareView];
            break;
        case JKCustomAnimationModeNone:
            [self hideWithOutAnimation];
            break;
        default:
            
            break;
    }
}

-(void)jk_hideView{
    [self removeKeyBoardListen];
    [self tapBgView];
}

#pragma mark- 动画显示

//弹出动画
-(void)showInWindow{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    if (supView) {
        [supView addSubview:self];
        self.center = supView.center;
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.center = [UIApplication sharedApplication].keyWindow.center;
    }
    self.alpha = 0;
    self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
    [UIView animateWithDuration:animationTime animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
}
//下滑出动画
-(void)upToDownShowInWindow{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGFloat x = ([UIApplication sharedApplication].keyWindow.bounds.size.width-self.frame.size.width)/2;
    CGFloat y = -self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    [UIView animateWithDuration:animationTime delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.center = [UIApplication sharedApplication].keyWindow.center;
    } completion:^(BOOL finished) {
        
    }];
}

/**
 下方弹出分享视图
 */
-(void)shareViewShowInWindow{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
    // usingSpringWithDamping数值越小，弹簧震动效果越好
    [UIView animateWithDuration:animationTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect  oldFrame = self.frame;
        oldFrame.origin.y = self.frame.origin.y-self.frame.size.height;
        self.frame = oldFrame;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)showViewWithOutAnimation{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    if (supView) {
        [supView addSubview:self];
        
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height);
    
    
    
    // usingSpringWithDamping数值越小，弹簧震动效果越好
    //    [UIView animateWithDuration:ShareTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveLinear animations:^{
    //        CGRect  oldFrame = self.frame;
    //        oldFrame.origin.y = self.frame.origin.y-self.frame.size.height+5;
    //        self.frame = oldFrame;
    //    } completion:^(BOOL finished) {
    //
    //    }];
}


#pragma mark - 动画隐藏

//弹出隐藏
-(void)hide{
    if (self.superview) {
        [UIView animateWithDuration:animationTime animations:^{
            self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self hideAnimationFinish];
        }];
    }
}
//下滑隐藏
-(void)dropDown{
    if (self.superview) {
        [UIView animateWithDuration:animationTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = CGRectMake(self.frame.origin.x, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            [self hideAnimationFinish];
        }];
    }
}


/**
 下方分享视图隐藏
 */
-(void)hideShareView{
    if (self.superview) {
        [UIView animateWithDuration:animationTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            [self hideAnimationFinish];
        }];
    }
}

-(void)hideWithOutAnimation{
    UIView *bgvi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (bgvi) {
        [bgvi removeFromSuperview];
    }
    [self removeFromSuperview];
}

/*
 -(void)hideBigImageView{
 if (self.superview) {
 [UIView animateWithDuration:AlertTime animations:^{
 self.frame = oldFrame;
 } completion:^(BOOL finished) {
 UIView *bgvi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
 if (bgvi) {
 [bgvi removeFromSuperview];
 }
 }];
 }
 }
 */

-(void)hideAnimationFinish{
    UIView *bgvi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (bgvi) {
        [bgvi removeFromSuperview];
    }
    [self removeFromSuperview];
}





/**
 加入背景view
 */
-(void)addViewInWindow{
    UIView *oldView;
    if (supView) {
        oldView = [supView viewWithTag:TagValue];
    }else{
        oldView = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    }
    if (oldView) {
        [oldView removeFromSuperview];
    }
    UIView *v = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    v.tag = TagValue;
    [self addGuesture:v];
    v.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:bgAlpha == -1 ? ALPHA : bgAlpha];
    if (isNeedEffective) {
        UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        effectView.frame = v.frame;
        effectView.alpha = 0.6;
        [v addSubview:effectView];
    }
    if (supView) {
        [supView addSubview:v];
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:v];
    }
    
}
//添加背景view手势
-(void)addGuesture:(UIView *)vi{
    vi.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBgView)];
    [vi addGestureRecognizer:tap];
}

- (void)jk_setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (!view) {
        view = self;
    }
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}


-(CGFloat)getAnimationTimeWithMode:(JKCustomAnimationMode)type{
    switch (type) {
        case JKCustomAnimationModeNone:
            return 0;
        case JKCustomAnimationModeShare:
            return self.frame.size.height / 300 * ShareTime;
        case JKCustomAnimationModeDrop:
            return DropTime;
        case JKCustomAnimationModeAlert:
            return AlertTime;
            
        default:
            break;
    }
}


#pragma mark - 键盘弹起监听
- (void)keyBoardListen {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)removeKeyBoardListen{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *userInfo = [noti userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;  // 得到键盘弹出后的键盘视图所在y坐标;
    CGFloat space = mode == JKCustomAnimationModeNone ? 0: 10.0;
    if (CGRectGetMaxY(self.frame)>=keyBoardEndY) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect _frame = self.frame;
            _frame.origin.y = keyBoardEndY-_frame.size.height-space;
            self.frame = _frame;
        }];
    }
    
}

- (void)keyboardWillHide:(NSNotification *)noti {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        if (mode==JKCustomAnimationModeShare||mode==JKCustomAnimationModeNone) {
            self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }else{
            self.center = [UIApplication sharedApplication].keyWindow.center;
        }
    }];
}



@end


