# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'GoogleSigninReusabelComponets' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'GoogleSignIn', '~> 7.0.0'


pre_install do |installer|
    def installer.verify_no_static_framework_transitive_dependencies; end
end


end
