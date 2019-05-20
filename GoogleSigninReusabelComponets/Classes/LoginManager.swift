//
//  LoginManager.swift
//  GoogleSigninReusabelComponets
//
//  Created by Sumit Goswami on 20/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit
import GoogleSignIn

//private let clientID = "your_client_id"


public class SSGoogleManager: NSObject {
    public let googleManager = GIDSignIn.sharedInstance()
    var userDataBlock:UserDataComplition?
    var userDidDisconnectWithBlock:UserDataComplition?
    
    public typealias UserDataComplition = (_  userData: UserData?, _ error: Error? ) -> ()
    
    fileprivate struct Static {
        static let instance = SSGoogleManager()
    }
    
    internal override init() {
        super.init()
    }
    
    // this is the Swift way to do singletons
    public class var manager: SSGoogleManager {
        return Static.instance
    }
    
    public func signOut() {
        googleManager?.signOut()
    }
    
    public func logInWithGoogle(clientId: String,complitionBlock:@escaping UserDataComplition,didDisconnectBlock:@escaping UserDataComplition)  {
        userDataBlock = complitionBlock
        userDidDisconnectWithBlock = didDisconnectBlock
        googleManager?.clientID = clientId
        googleManager?.delegate = self
        googleManager?.signIn()
    }

    public func handelOpenUrl(app: UIApplication,url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return (googleManager?.handle(url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]))!
    }
}

// MARK: - GIDSignInDelegate
extension SSGoogleManager: GIDSignInDelegate {
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            if let block = self.userDataBlock {
                block(nil, error)
            }
        } else {
            // Perform any operations on signed in user here.
             let data = UserData(
                userId: user.userID,
                idToken: user.authentication.idToken,
                fullName: user.profile.name,
                givenName: user.profile.givenName,
                familyName: user.profile.familyName,
                email: user.profile.email,
                accessToken: user.authentication.accessToken)
            if let block = self.userDataBlock {
                block(data, nil)
            }
        }
    }
    
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            if let block = self.userDidDisconnectWithBlock {
                block(nil, error)
            }
        } else {
            // Perform any operations on signed in user here.
            let data = UserData(
                userId: user.userID,
                idToken: user.authentication.idToken,
                fullName: user.profile.name,
                givenName: user.profile.givenName,
                familyName: user.profile.familyName,
                email: user.profile.email,
                accessToken: user.authentication.accessToken)
            if let block = self.userDidDisconnectWithBlock {
                block(data, nil)
            }
        }
    }
}

// MARK: - GIDSignInUIDelegate
extension SSGoogleManager: GIDSignInUIDelegate {
    
    public func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        
    }
    
    public func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        
    }
    
}
