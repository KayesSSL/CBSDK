Pod::Spec.new do |s|
  s.name             = 'CBSDK'
  s.version          = '0.0.1'
  s.summary          = 'CashBaba SDK for Better Cash transaction experience.'
  s.homepage         = 'https://github.com/KayesSSL/CBSDK.git'
  s.license          = { :type => 'GNU', :file => 'LICENSE' }
  s.author           = { 'Imrul Kayes' => 'imrul.kayes@sslwireless.com' }
  s.source           = { :git => 'https://github.com/KayesSSL/CBSDK.git', :tag => s.version }
  s.default_subspecs = 'Release'

  s.ios.deployment_target = '11.0'

  # Debug Subspec
  s.subspec 'Debug' do |debug|
    debug.vendored_frameworks = [
      'Debug/App.xcframework',
      'Debug/camera_avfoundation.xcframework',
      'Debug/connectivity_plus.xcframework',
      'Debug/device_info_plus.xcframework',
      'Debug/file_picker.xcframework',
      'Debug/flutter_localization.xcframework',
      'Debug/image_picker_ios.xcframework',
      'Debug/path_provider_foundation.xcframework',
      'Debug/share_plus.xcframework',
      'Debug/shared_preferences_foundation.xcframework',
      'Debug/smart_auth.xcframework',
      'Debug/FlutterPluginRegistrant.xcframework',
      'Debug/Flutter.xcframework'
    ]
  end

  # Release Subspec
  s.subspec 'Release' do |release|
    release.vendored_frameworks = [
      'Release/App.xcframework',
      'Release/camera_avfoundation.xcframework',
      'Release/connectivity_plus.xcframework',
      'Release/device_info_plus.xcframework',
      'Release/file_picker.xcframework',
      'Release/flutter_localization.xcframework',
      'Release/image_picker_ios.xcframework',
      'Release/path_provider_foundation.xcframework',
      'Release/share_plus.xcframework',
      'Release/shared_preferences_foundation.xcframework',
      'Release/smart_auth.xcframework',
      'Release/FlutterPluginRegistrant.xcframework',
      'Release/Flutter.xcframework'
    ]
  end
end
