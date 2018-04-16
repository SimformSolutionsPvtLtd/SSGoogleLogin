Pod::Spec.new do |s|
  s.name             = 'SSGoogleLogin'
  s.version          = '1.0.1'
  s.summary          = 'The Reusable Google Login Components for iOS is the easiest way to get data from Google.'
 
  s.description      = 'The Reusable Google Login Components for iOS is the easiest way to get data from Google.'
 
  s.homepage         = 'https://github.com/simformsolutions/SSGoogleLogin.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sanjaysinh Chauhan' => 'sanjaysinh.C@simformsolutions.com' }
  s.source           = { :git => 'https://github.com/simformsolutions/SSGoogleLogin.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'GoogleSigninReusabelComponets/Classes/*.swift'
  s.static_framework = true
    s.dependency 'GoogleSignIn', '>4.1'

  
end
