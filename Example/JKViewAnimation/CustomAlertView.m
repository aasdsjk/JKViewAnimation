//
//  CustomAlertView.m
//  CustomAnimation
//
//  Created by ning on 2017/4/17.
//  Copyright © 2017年 songjk. All rights reserved.
//

#import "CustomAlertView.h"

#import "UIView+CustomAlertView.h"

@interface CustomAlertView ()
@property (nonatomic,strong) UITextField *textField;
@end


@implementation CustomAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor greenColor];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 50, 30);
        btn.center = self.center;
        [self addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.textField];
        
    }
    return self;
}
-(void)btnClick:(UIButton *)btn{
    [self jk_hideView];
}

-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200-60, 160, 30)];
        _textField.borderStyle = UITextBorderStyleLine;
        _textField.placeholder = @"输入框";
    }
    return _textField;
}
@end
