Pod::Spec.new do |s|
  s.name             = 'Dots'
  s.version          = '1.0.0'
  s.summary          = 'Modern loading indicator for iOS 10 which allows the app to use Google-like dots animation for loading indicator.'

  s.description      = 'Modern loading indicator for iOS 10 which allows the app to use Google-like dots animation for loading indicator with just two lines..'

  s.homepage         = 'https://github.com/makomori/Dots'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'makomori' => 'makomori26@gmail.com' }
  s.source           = { :git => 'https://github.com/makomori/Dots.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/makomori26>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Dots/Classes/**/*'
end
