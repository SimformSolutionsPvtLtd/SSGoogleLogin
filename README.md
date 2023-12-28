# Google Signin Reusabel Componets


The GoogleSigninReusabelComponets for iOS is the easiest way to get data  from Google .


## Features

- [x] Get Specific user data from google

## Requirements

- iOS 11.2+
- Xcode 14.3
Note: For Xcode version lower than 14.3 use version 2.0.1

## Installation

#### Take LoginManager.swift and userData.Swift
Import two files in your project and it's done

#### Manually
1. Configure Google App Settings for iOS (https://developers.google.com/identity/sign-in/ios/sign-in?ver=swift)
2. Download Google SDK Or Pod's for iOS
3. Add SDK to Project
4. Configure Xcode Project
5. Connect App Delegate Using LoginManager.swift Methods
6. Congratulations!

## Usage example

##### Developer must have to implement open url method in appdelegate file.

```swift

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation:
    Any) -> Bool {
        return  SSGoogleManager.manager.handleOpenUrl(app: app, url: url)
    }
```
##### For Version 3.0.0 (you can get default data when not passing any argument)

```swift
SSGoogleManager.manager.logInWithGoogle(clientId: <Client_ID (StringFormat)>, presenting: UIViewController) { result in
    switch result {
        case .success(let userData):
            print(userData)
        case .failure(let error):
            print(error.localizedDescription)
         }
    } 
    didDisconnectBlock: { result in
    switch result {
        case .success(let userData):
            print(userData)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
```

##### For Version 2.0.1 (you can get default data when not passing any argument)

```swift
SSGoogleManager.manager.logInWithGoogle(clientId: <Client_ID (StringFormat)> ,controller: self, complitionBlock: { (userData, error) in
    if error == nil {
        print(userData ?? "")
    } else {
        print(error?.localizedDescription ?? "")
    }
    }) { (userData, error) in
    if error == nil {
        print(userData ?? "")
    } else {
        print(error?.localizedDescription ?? "")
    }
}
```


