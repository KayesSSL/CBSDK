Pod::Spec.new do |s|
  s.name             = 'CBSDK'
  s.version          = '0.0.4'
  s.summary          = 'CashBaba SDK for Better Cash transaction experience.'
  s.homepage         = 'https://github.com/KayesSSL/CBSDK.git'
  s.license          = { :type => 'GNU', :file => 'LICENSE' }
  s.author           = { 'Imrul Kayes' => 'imrul.kayes@sslwireless.com' }
  s.source           = { :git => 'https://github.com/KayesSSL/CBSDK.git', :tag => s.version }
  s.source_files = 'CBSDKHelper/**/*'
  


  s.ios.deployment_target = '15.1'

  s.subspec 'CBSDK' do |cbsdk| 
    cbsdk.vendored_frameworks = 'App.xcframework' 
  end 
  s.subspec 'camera_avfoundation' do |camera_avfoundation| 
    camera_avfoundation.vendored_frameworks = 'camera_avfoundation.xcframework' 
  end 
  s.subspec 'connectivity_plus' do |connectivity_plus| 
    connectivity_plus.vendored_frameworks = 'connectivity_plus.xcframework' 
  end 
  s.subspec 'device_info_plus' do |device_info_plus| 
    device_info_plus.vendored_frameworks = 'device_info_plus.xcframework' 
  end 
  s.subspec 'file_picker' do |file_picker| 
    file_picker.vendored_frameworks = 'file_picker.xcframework' 
  end 
  s.subspec 'flutter_localization' do |flutter_localization| 
    flutter_localization.vendored_frameworks = 'flutter_localization.xcframework' 
  end 
  s.subspec 'image_picker_ios' do |image_picker_ios| 
    image_picker_ios.vendored_frameworks = 'image_picker_ios.xcframework' 
  end 
  s.subspec 'path_provider_foundation' do |path_provider_foundation| 
    path_provider_foundation.vendored_frameworks = 'path_provider_foundation.xcframework' 
  end 
  s.subspec 'share_plus' do |share_plus| 
    share_plus.vendored_frameworks = 'share_plus.xcframework' 
  end 
  s.subspec 'shared_preferences_foundation' do |shared_preferences_foundation| 
    shared_preferences_foundation.vendored_frameworks = 'shared_preferences_foundation.xcframework' 
  end 
  s.subspec 'smart_auth' do |smart_auth| 
    smart_auth.vendored_frameworks = 'smart_auth.xcframework' 
  end 
  s.subspec 'FlutterPluginRegistrant' do |flutterpluginregistrant| 
    flutterpluginregistrant.vendored_frameworks = 'FlutterPluginRegistrant.xcframework' 
  end
  s.subspec 'Flutter' do |flutter| 
    flutter.vendored_frameworks = 'Flutter.xcframework'
  end
  

  
end
