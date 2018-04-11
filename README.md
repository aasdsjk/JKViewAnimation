# JKViewAnimation

[![CI Status](http://img.shields.io/travis/aasdsjk/JKViewAnimation.svg?style=flat)](https://travis-ci.org/aasdsjk/JKViewAnimation)
[![Version](https://img.shields.io/cocoapods/v/JKViewAnimation.svg?style=flat)](http://cocoapods.org/pods/JKViewAnimation)
[![License](https://img.shields.io/cocoapods/l/JKViewAnimation.svg?style=flat)](http://cocoapods.org/pods/JKViewAnimation)
[![Platform](https://img.shields.io/cocoapods/p/JKViewAnimation.svg?style=flat)](http://cocoapods.org/pods/JKViewAnimation)

## Example
#import <JKViewAnimation/UIView+CustomAlertView.h>

///创建自定义视图
CustomAlertView *alert = [[CustomAlertView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];

///调用分类方法  animationMode CustomAnimationMode 三种模式
[alert jk_showInWindowWithMode:JKCustomAnimationModeAlert inView:nil bgAlpha:0.2 needEffectView:YES];

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JKViewAnimation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JKViewAnimation'
```

## Author

sjk, 1289647068@qq.com



## License

JKViewAnimation is available under the MIT license. See the LICENSE file for more info.
