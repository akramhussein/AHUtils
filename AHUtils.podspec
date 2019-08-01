Pod::Spec.new do |s|
  s.name             = 'AHUtils'
  s.version          = '0.0.1'
  s.summary          = 'Shared extensions and classes'
  s.description      = <<-DESC
Library of shared extensions and classes I used across many project
DESC

  s.homepage         = 'https://github.com/akramhussein/AHUtils'
  s.license          = { :type => 'Copyright', :text => 'Copyright 2019 Akram Hussein. All Rights Reserved.' }
  s.author           = { 'Akram Hussein' => 'akramhussein@gmail.com' }
  s.source           = { :git => 'https://github.com/akramhussein/AHUtils.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files  = 'AHUtils/Classes/**/*'
  s.resource_bundles = {
    'AHUtils' => ['AHUtils/Assets/**/*.{lproj,xib,xcassets}'],
  }

  s.frameworks    = 'Foundation', 'UIKit'
  s.dependency 'MBProgressHUD'
end
