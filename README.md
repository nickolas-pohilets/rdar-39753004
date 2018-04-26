[rdar://39753004](http://www.openradar.appspot.com/radar?id=4985398572875776)

### Irrelevant crash reports are included in `DerivedData/Logs/Attachments` when running UI tests in parallel on multiple simulators

#### Summary:
In order to harness the full power of MacPro's and other Mac hardware, we are running UI tests in parallel on multiple simulators using multiple parallel invocations of xcodebuild.

If SUT crashes in one of the invocations of xcodebuild, it will be recorded in all invocations runnings at that moment.

When collecting crash logs, test manager should check for device ID and/or PIDs recorded in the crash log and report only relevant crash logs.

#### Steps to Reproduce:
1. Check out [https://github.com/nickolas-pohilets/rdar-39753004](https://github.com/nickolas-pohilets/rdar-39753004)
2. Create two or more simulators of the same configuration (iPhone 6, iOS 11.3)
3. Execute `run.sh` passing ID's of the simulator devices

#### Expected Results:
Each of the `$DEVICE_ID/Logs/Attachments` should contain 4 crash reports, which occurred on that device only.

#### Actual Results:
Each of the `$DEVICE_ID/Logs/Attachments` contains (almost) all of the crash reports regardless of the device they occurred on.

#### Version/Build:
Xcode 9.2 (9C40b), Xcode 9.3 (9E145), Xcode 9.4b (9Q1004a)

##### Configuration:
macOS 10.13.4 (17E199)
