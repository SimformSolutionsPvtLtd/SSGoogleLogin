# Google Signin Reusabel Componets


The GoogleSigninReusabelComponets for iOS is the easiest way to get data  from Google .


## Features

- [x] Get Specific user data from google

## Requirements

- iOS 8.0+
- Xcode 7.3

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
        return  SSGoogleManager.shared.facebookUrlConfiguration(application, open: url,
        sourceApplication:
        sourceApplication, annotation: annotation)
    }
```

#####example 1(you can get default data when not passing any argument)

```swift
SSGoogleManager.shared.logInWithGoogle(clientId: <Client_ID (StringFormat)> ,controller: self, complitionBlock: { (userData, error) in
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


