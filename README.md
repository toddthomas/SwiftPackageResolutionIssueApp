# SwiftPackageResolutionIssueApp

This silly app exists mostly to test using a Swift package dependency in an Xcode project.

You can use it to reproduce FB12208132, "Swift Package dependencies are resolved to the last revision Xcode 14.3.x built with, instead of the revision specified in Package.resolved."

Steps to reproduce:
1. git clone https://github.com/toddthomas/SwiftPackageResolutionIssueApp.git
2. cd SwiftPackageResolutionIssueApp
3. git checkout 2.0.0 # to checkout the revision previous to HEAD of main which uses an earlier version of the libfib Swift Package dependency
4. open SwiftPackageResolutionIssueApp.xcodeproj # Using Xcode 14.3 or 14.3.1
5. git diff # note there are no diffs
6. git checkout main # in this revision of the app project, the libfib dependency has been updated from 2.0.2 to 2.0.3
7. git diff # note diff in Package.resolved that shows local reversion to libfib 2.0.2
8. Quit Xcode
9. git restore SwiftPackageResolutionIssueApp.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved
10. rm -rf ~/Library/Developer/Xcode/DerivedData/SwiftPackageResolutionIssueApp-*
11. open SwiftPackageResolutionIssueApp.xcodeproj # Using Xcode 14.3 or 14.3.1
12. git diff # note no diffs, libfib was resolved to 2.0.3 as specified in Package.resolved
