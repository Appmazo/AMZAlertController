#
# Be sure to run `pod lib lint AlertController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AlertController'
    s.version          = '1.0.0'
    s.summary          = 'A simple and modern alert controller.'
    s.swift_version    = '4.1'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    AlertController is a simple and modern alert controller to is better than but familiar to UIAlertController.
    DESC
    
    s.homepage         = 'https://github.com/Appmazo/AlertController'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Appmazo LLC' => 'jhickman@appmazo.com' }
    s.source           = { :git => 'https://github.com/Appmazo/AlertController.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/appmazo'
    
    s.ios.deployment_target = '11.0'
    
    s.source_files = 'AlertController/Classes/**/*.*'
    #s.resources = 'AlertController/Assets/**/*.*'
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'AppmazoUIKit', '~> 1.0.1'
end
