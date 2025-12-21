## Project Setup
- Remove the storyboard file
- Change the version to 0.1

### `Info.plist` Config
- Remove `UISceneStoryboardFile` from the Info.plist in the App Target
```
<key>UISceneStoryboardFile</key>
<string>Main</string>
```
- Add these domain HTTPS exceptions
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>{ip-address-if-included}</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
        <key>localhost.proxyman.io</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
        <key>res.cloudinary.com</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
    </dict>
</dict>
```
- Add `remote-notification`
```
<key>UIBackgroundModes</key>
<array>
    <string>remote-notification</string>
</array>
```
- Add `NSCameraUsageDescription`
```
<string>This app uses the camera to allow you to take photos for your profile picture.</string>
```

### 

### Google Sign in

### Push Notifications

