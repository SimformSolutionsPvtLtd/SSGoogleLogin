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
typealias UserDataComplition = (_  userData: UserData?, _ error: Error? ) -> ()

class LoginManager: NSObject {
    let googleManager = GIDSignIn.sharedInstance()
    var userDataBlock:UserDataComplition?
    var userDidDisconnectWithBlock:UserDataComplition?
    
    struct Static {
        static let instance = LoginManager()
    }
    
    class var shared: LoginManager {
        return Static.instance
    }
    
    func logInWithGoogle(clientId: String,complitionBlock:@escaping UserDataComplition,didDisconnectBlock:@escaping UserDataComplition)  {
        userDataBlock = complitionBlock
        userDidDisconnectWithBlock = didDisconnectBlock
        googleManager?.clientID = clientId
        googleManager?.delegate = self
        googleManager?.signIn()
    }

    func handelOpenUrl(app: UIApplication,url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return (googleManager?.handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation]))!
    }
}

extension LoginManager:GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            if let block = self.userDataBlock {
                block(nil,error)
            }
        } else {
            // Perform any operations on signed in user here.
             let data = UserData(
                userId: user.userID,
                idToken: user.authentication.idToken,
                fullName: user.profile.name,
                givenName: user.profile.givenName,
                familyName: user.profile.familyName,
                email: user.profile.email )
            if let block = self.userDataBlock {
              block(data,nil)
            }
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            if let block = self.userDidDisconnectWithBlock {
                block(nil,error)
            }
        } else {
            // Perform any operations on signed in user here.
            let data = UserData(
                userId: user.userID,
                idToken: user.authentication.idToken,
                fullName: user.profile.name,
                givenName: user.profile.givenName,
                familyName: user.profile.familyName,
                email: user.profile.email )
            if let block = self.userDidDisconnectWithBlock {
                block(data,nil)
            }
        }
    }
}


