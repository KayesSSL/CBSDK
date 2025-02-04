Pod::Spec.new do |s|
  s.name             = 'CBSDK'
  s.version          = '0.1.4'
  s.summary          = 'CashBaba SDK for Better Cash transaction experience.'
  s.homepage         = 'https://github.com/KayesSSL/CBSDK.git'
  s.license          = { :type => 'GNU', :file => 'LICENSE' }
  s.author           = { 'Imrul Kayes' => 'imrul.kayes@sslwireless.com' }
  s.source           = { :git => 'https://github.com/KayesSSL/CBSDK.git', :tag => s.version }
  s.source_files = 'CBSDKHelper/**/*'
  


  s.ios.deployment_target = '11.0'

  s.subspec 'CBSDK' do |cbsdk| 
    cbsdk.vendored_frameworks = 'App.xcframework' 
  end 
  s.subspec 'camera_avfoundation' do |camera_avfoundation| 
    camera_avfoundation.vendored_frameworks = 'camera_avfoundation.xcframework' 
  end 
  s.subspec 'file_picker' do |file_picker| 
    file_picker.vendored_frameworks = 'file_picker.xcframework' 
  end 
  s.subspec 'FlutterPluginRegistrant' do |flutterpluginregistrant| 
    flutterpluginregistrant.vendored_frameworks = 'FlutterPluginRegistrant.xcframework' 
  end
  s.subspec 'Flutter' do |flutter| 
    flutter.vendored_frameworks = 'Flutter.xcframework'
  end
  
  s.dependency 'DKImagePickerController'
  s.dependency 'DKPhotoGallery'
  s.dependency 'SDWebImage'
  s.dependency 'SwiftyGif'

  
end
