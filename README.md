# JKViewAnimation

[![CI Status](http://img.shields.io/travis/aasdsjk/JKViewAnimation.svg?style=flat)](https://travis-ci.org/aasdsjk/JKViewAnimation)
[![Version](https://img.shields.io/cocoapods/v/JKViewAnimation.svg?style=flat)](http://cocoapods.org/pods/JKViewAnimation)
[![License](https://img.shields.io/cocoapods/l/JKViewAnimation.svg?style=flat)](http://cocoapods.org/pods/JKViewAnimation)
[![Platform](https://img.shields.io/cocoapods/p/JKViewAnimation.svg?style=flat)](http://cocoapods.org/pods/JKViewAnimation)

## Example
#import <JKViewAnimation/UIView+CustomAlertView.h>

CustomAlertView *alert = [[CustomAlertView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
alert.isTapBgViewUnUse = NO;///默认

[alert jk_showInWindowWithMode:JKCustomAnimationModeAlert inView:nil bgAlpha:0.2 needEffectView:YES];

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JKViewAnimation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JKViewAnimation','~>1.0.3'
```
pod 1.0.2 （修改方法名，避免与系统的方法冲突）

pod 1.0.3  (增加多个属性控制背景点击，透明度等等)
## Author

sjk, 1289647068@qq.com

##如果对您有帮助，Star一下



## License

JKViewAnimation is available under the MIT license. See the LICENSE file for more info.
