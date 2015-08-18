Pod::Spec.new do |s|
  s.name             = "MXVerticalTabBarController"
  s.version          = "0.1.0"
  s.summary          = "vertical tabBarController"

  s.homepage         = "https://github.com/longminxiang/MXVerticalTabBarController"

  s.license          = 'MIT'
  s.author           = { "Eric Lung" => "longminxiang@gmail.com" }
  s.source           = { :git => "https://github.com/longminxiang/MXVerticalTabBarController.git", :tag => "v" + s.version.to_s }
  s.platform         = :ios, '7.0'
  s.requires_arc     = true

  s.source_files = 'MXVerticalTabBarController/**/*.{h,m}'

end