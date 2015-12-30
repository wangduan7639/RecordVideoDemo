platform :ios, :deployment_target => “7.0”

pod 'Masonry', '0.6.1'
pod 'RETableViewManager', '1.6'
pod 'MBProgressHUD', '~> 0.9.2'
pod 'SCRecorder', '~> 2.6.1'
pod 'ReactiveCocoa', '2.4.7'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_STRICT_OBJC_MSGSEND'] = 'NO'
        end
    end
end

inhibit_all_warnings!



