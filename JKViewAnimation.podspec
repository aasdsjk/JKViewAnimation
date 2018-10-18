#
# Be sure to run `pod lib lint JKViewAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JKViewAnimation'
  s.version          = '1.0.3'
  s.summary          = '自定义视图弹出动画'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
自定义视图几种简单弹出动画封装，只用调用方法即可
                       DESC

  s.homepage         = 'https://github.com/aasdsjk/JKViewAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sjk' => '1289647068@qq.com' }
  s.source           = { :git => 'https://github.com/aasdsjk/JKViewAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JKViewAnimation/Classes/*'
  
  # s.resource_bundles = {
  #   'JKViewAnimation' => ['JKViewAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
