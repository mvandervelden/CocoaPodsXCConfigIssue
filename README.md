# CocoaPodsXCConfigIssue

This sample app reproduces [Issue 10687 of the CocoaPods GH repo](https://github.com/CocoaPods/CocoaPods/issues/10687).

## Environment
* Xcode 12.5.1 (12E507)
* CocoaPods 1.10.2

## Setup
The workspace consists of a main app `CocoaPodsXCConfigIssue` (having a dependency on the `Sourcery` pod), and a Swift framework `CocoaPodsXCConfigIssueFramework` (with a dependency on `Alamofire`). The app has a dependency on the framework.

XCConfig files are used to keep the build configuration out of the Xcode project files. This is done on a project level for both projects, and on a target level for the `CocoaPodsXCConfigIssueFramework` framework.

The target xcconfigs `target.debug.xcconfig` and `target.release.xcconfig` refer to the path of the Pods xcconfig file using `#include "../../Pods/Target Support Files/Pods-CocoaPodsXCConfigIssueFramework/Pods-CocoaPodsXCConfigIssueFramework.release.xcconfig"`. This works, as can be seen when looking at the build settings for the target in Xcode. Also, compiling & testing the build works as expected.

However, CocoaPods warns about an apparent misconfiguration, as explained below.

## Steps to Reproduce
* Clone the repo
* `bundle install` to setup CocoaPods if needed
* `be pod install` to install the pods

### Expected Behavior
* It installs the Pods for the main app and framework without complaining

### Actual Behavior
* CocoaPods throws 2 warnings:
>[!] CocoaPods did not set the base configuration of your project because your project already has a custom config set. In order for CocoaPods integration to work at all, please either set the base configurations of the target `CocoaPodsXCConfigIssueFramework` to `Target Support Files/Pods-CocoaPodsXCConfigIssueFramework/Pods-CocoaPodsXCConfigIssueFramework.debug.xcconfig` or include the `Target Support Files/Pods-CocoaPodsXCConfigIssueFramework/Pods-CocoaPodsXCConfigIssueFramework.debug.xcconfig` in your build configuration (`Components/CocoaPodsXCConfigIssueFramework/CocoaPodsXCConfigIssueFramework/Configs/target.debug.xcconfig`).
>
>[!] CocoaPods did not set the base configuration of your project because your project already has a custom config set. In order for CocoaPods integration to work at all, please either set the base configurations of the target `CocoaPodsXCConfigIssueFramework` to `Target Support Files/Pods-CocoaPodsXCConfigIssueFramework/Pods-CocoaPodsXCConfigIssueFramework.release.xcconfig` or include the `Target Support Files/Pods-CocoaPodsXCConfigIssueFramework/Pods-CocoaPodsXCConfigIssueFramework.release.xcconfig` in your build configuration (`Components/CocoaPodsXCConfigIssueFramework/CocoaPodsXCConfigIssueFramework/Configs/target.release.xcconfig`).
