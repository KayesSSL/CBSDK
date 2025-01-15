Pod::Spec.new do |s|
s.name = 'CBSDK'
s.version = '0.0.1'
s.summary = 'CashBaba SDK for Better Cash transaction experience.'
s.homepage = 'https://github.com/KayesSSL/CBSDK.git'
s.license = { :type => 'GNU', :file => 'LICENSE' }
s.author = { 'Imrul Kayes' => 'imrul.kayes@sslwireless.com' }
s.source  = { :git => 'https://github.com/KayesSSL/CBSDK.git', :tag => s.version }
s.default_subspecs = 'Release'

s.ios.deployment_target = '11.0'

s.subspec 'Debug' do |debug|
    debug.subspec 'App' do |app|
        app.vendored_frameworks = 'Debug/App.xcframework'
    end
    debug.subspec 'camera_avfoundation' do |camera_avfoundation|
     camera_avfoundation.vendored_frameworks = 'Debug/camera_avfoundation.xcframework'
    end
    debug.subspec 'connectivity_plus' do |connectivity_plus|
     connectivity_plus.vendored_frameworks = 'Debug/connectivity_plus.xcframework'
    end
    debug.subspec 'device_info_plus' do |device_info_plus|
     device_info_plus.vendored_frameworks = 'Debug/device_info_plus.xcframework'
    end
    debug.subspec 'file_picker' do |file_picker|
     file_picker.vendored_frameworks = 'Debug/file_picker.xcframework'
    end
    debug.subspec 'flutter_localization' do |flutter_localization|
     flutter_localization.vendored_frameworks = 'Debug/flutter_localization.xcframework'
    end

    debug.subspec 'image_picker_ios' do |image_picker_ios|
     image_picker_ios.vendored_frameworks = 'Debug/image_picker_ios.xcframework'
    end
    debug.subspec 'path_provider_foundation' do |path_provider_foundation|
     path_provider_foundation.vendored_frameworks = 'Debug/path_provider_foundation.xcframework'
    end
    debug.subspec 'share_plus' do |share_plus|
     share_plus.vendored_frameworks = 'Debug/share_plus.xcframework'
    end
    debug.subspec 'shared_preferences_foundation' do |shared_preferences_foundation|
     shared_preferences_foundation.vendored_frameworks = 'Debug/shared_preferences_foundation.xcframework'
    end
    debug.subspec 'smart_auth' do |smart_auth|
     smart_auth.vendored_frameworks = 'Debug/smart_auth.xcframework'
    end
    debug.subspec 'FlutterPluginRegistrant' do |flutterpluginregistrant|
     flutterpluginregistrant.vendored_frameworks = 'Debug/FlutterPluginRegistrant.xcframework'
    end
    debug.subspec 'Flutter' do |flutter|
      flutter.vendored_frameworks = 'Debug/Flutter.xcframework'
    end
end

s.subspec 'Release' do |release|
    release.subspec 'App' do |app|
        app.vendored_frameworks = 'Release/App.xcframework'
    end
    release.subspec 'camera_avfoundation' do |camera_avfoundation|
     camera_avfoundation.vendored_frameworks = 'Release/camera_avfoundation.xcframework'
    end
    release.subspec 'connectivity_plus' do |connectivity_plus|
     connectivity_plus.vendored_frameworks = 'Release/connectivity_plus.xcframework'
    end
    release.subspec 'device_info_plus' do |device_info_plus|
     device_info_plus.vendored_frameworks = 'Release/device_info_plus.xcframework'
    end
    release.subspec 'file_picker' do |file_picker|
     file_picker.vendored_frameworks = 'Release/file_picker.xcframework'
    end
    release.subspec 'flutter_localization' do |flutter_localization|
     flutter_localization.vendored_frameworks = 'Release/flutter_localization.xcframework'
    end

    release.subspec 'image_picker_ios' do |image_picker_ios|
     image_picker_ios.vendored_frameworks = 'Release/image_picker_ios.xcframework'
    end
    release.subspec 'path_provider_foundation' do |path_provider_foundation|
     path_provider_foundation.vendored_frameworks = 'Release/path_provider_foundation.xcframework'
    end
    release.subspec 'share_plus' do |share_plus|
     share_plus.vendored_frameworks = 'Release/share_plus.xcframework'
    end
    release.subspec 'shared_preferences_foundation' do |shared_preferences_foundation|
     shared_preferences_foundation.vendored_frameworks = 'Release/shared_preferences_foundation.xcframework'
    end
    release.subspec 'smart_auth' do |smart_auth|
     smart_auth.vendored_frameworks = 'Release/smart_auth.xcframework'
    end
    release.subspec 'FlutterPluginRegistrant' do |flutterpluginregistrant|
     flutterpluginregistrant.vendored_frameworks = 'Release/FlutterPluginRegistrant.xcframework'
    end
    release.subspec 'Flutter' do |flutter|
      flutter.vendored_frameworks = 'Release/Flutter.xcframework'
    end
end
