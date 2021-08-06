# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

platform :ios, '14.0'

use_frameworks!
# inhibit_all_warnings!

workspace 'CocoaPodsXCConfigIssue'

def framework_pods
  pod 'Alamofire'
end

target 'CocoaPodsXCConfigIssueFramework' do
    project 'Components/CocoaPodsXCConfigIssueFramework/CocoaPodsXCConfigIssueFramework'

    framework_pods
end

target 'CocoaPodsXCConfigIssue' do
    pod 'Sourcery'

    framework_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          # When migrating to Xcode12, the minimum deployment target of many pods was still 8.0,
          # while Xcode 12 only supports deployment targets of 9.0 and higher.
          # https://github.com/CocoaPods/CocoaPods/issues/9884
          if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
          end
      end
  end
end
