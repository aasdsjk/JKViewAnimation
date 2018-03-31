//
//  JKViewController.m
//  JKViewAnimation
//
//  Created by aasdsjk on 03/31/2018.
//  Copyright (c) 2018 aasdsjk. All rights reserved.
//

#import "JKViewController.h"
#import "CustomAlertView.h"
#import "CustomShareView.h"
#import <JKViewAnimation/UIView+CustomAlertView.h>
@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)alertAction:(id)sender {
    
    CustomAlertView *alert = [[CustomAlertView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [alert jk_showInWindowWithMode:JKCustomAnimationModeAlert inView:nil bgAlpha:0.2 needEffectView:YES];
    
}

- (IBAction)dropAction:(id)sender {
    CustomAlertView *alert = [[CustomAlertView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [alert jk_showInWindowWithMode:JKCustomAnimationModeDrop inView:nil bgAlpha:0.2 needEffectView:NO];
    UIView *vi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    vi.userInteractionEnabled = NO;
}

- (IBAction)shareAnimation:(id)sender {
    CustomShareView *share = [[CustomShareView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [share jk_showInWindowWithMode:JKCustomAnimationModeShare inView:nil bgAlpha:0.2 needEffectView:NO];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
