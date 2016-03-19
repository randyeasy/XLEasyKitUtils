#
# Be sure to run `pod lib lint XLEasyKitUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "XLEasyKitUtils"
  s.version          = "0.1.0"
  s.summary          = "UI相关的简单工具类."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
            UI相关的简单工具类 包含UIalertView block、UIButtonEdge、UIColor、UIView、UIImage、KeyBoard自动移动输入区域。
                       DESC

  s.homepage         = "https://github.com/randyeasy/XLEasyKitUtils"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "晓亮" => "ouyaliang@163.com" }
  s.source           = { :git => "https://github.com/randyeasy/XLEasyKitUtils.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'

s.prefix_header_contents =
'#import <PureLayout/PureLayout.h>'

  s.dependency 'PureLayout', '~> 3.0.1'

end
