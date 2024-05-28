Pod::Spec.new do |s|
  s.name             = 'GKSliderView'
  s.version          = '1.2.1'
  s.summary          = 'GKSliderView - iOS自定义滑杆、进度条控件'
  s.description      = <<-DESC
一个自定义的滑杆、进度条控件，可替代系统的UISlider、UIProgressView，实现对应的功能
                       DESC

  s.homepage         = 'https://github.com/QuintGao/GKSliderView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'QuintGao' => '1094887059@qq.com' }
  s.source           = { :git => 'https://github.com/QuintGao/GKSliderView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/QuintGao'
  s.platform         = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'GKSliderView/Classes/*.{h,m}'
end
