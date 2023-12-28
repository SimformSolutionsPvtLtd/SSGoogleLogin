Pod::Spec.new do |s|
  s.name             = 'SSGoogleLogin'
  s.version          = '3.0.0'
  s.summary          = 'The Reusable Google Login Components for iOS is the easiest way to get data from Google.'
 
  s.description      = 'The Reusable Google Login Components for iOS is the easiest way to get data from Google.'
 
  s.homepage         = 'https://github.com/simformsolutions/SSGoogleLogin.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sanjaysinh Chauhan' => 'sanjaysinh.C@simformsolutions.com' }
  s.source           = { :git => 'https://github.com/simformsolutions/SSGoogleLogin.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '11.2'
  s.swift_version = '5.9'
  s.source_files = 'GoogleSigninReusabelComponets/Classes/*.swift'
  s.static_framework = true
  s.dependency 'GoogleSignIn', '7.0.0'

  
end
