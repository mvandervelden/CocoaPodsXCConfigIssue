platform :ios, '14.5'

use_frameworks!

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
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.5'
    end
  end
end
