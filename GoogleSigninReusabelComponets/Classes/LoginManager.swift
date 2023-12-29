//
//  LoginManager.swift
//  GoogleSigninReusabelComponets
//
//  Created by Sumit Goswami on 20/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit
import GoogleSignIn

public class SSGoogleManager: NSObject {
    
    public let googleManager = GIDSignIn.sharedInstance
    var userDataBlock:UserDataCompletion?
    var userDidDisconnectWithBlock:UserDataCompletion?
    var signInConfig:GIDConfiguration?
    
    public typealias UserDataCompletion = (Result<UserData, Error>) -> ()
    
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
        googleManager.signOut()
    }
    
    public func logInWithGoogle(clientId: String, 
                                presenting: UIViewController,
                                completionBlock: @escaping UserDataCompletion,
                                didDisconnectBlock: @escaping UserDataCompletion) {
        signInConfig = GIDConfiguration.init(clientID: clientId)
        googleManager.configuration = signInConfig
        userDataBlock = completionBlock
        userDidDisconnectWithBlock = didDisconnectBlock
        
        googleManager.signIn(withPresenting: presenting) { googleUser, error in
            if let error = error {
                print("\(error.localizedDescription)")
                if let block = self.userDataBlock {
                    block(.failure(error))
                }
            } else {
                var data = UserData()
                if let signInUser = googleUser?.user {
                    data.userId = signInUser.userID
                    data.idToken = signInUser.idToken?.tokenString
                    data.accessToken = signInUser.accessToken.tokenString
                    data.fullName = signInUser.profile?.name
                    data.givenName = signInUser.profile?.givenName
                    data.familyName = signInUser.profile?.familyName
                    data.email = signInUser.profile?.email
                }
                if let block = self.userDataBlock {
                    block(.success(data))
                }
            }
        }
    }
    
    public func handleOpenUrl(app: UIApplication,url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var handled: Bool = false
        handled = googleManager.handle(url)
        return handled
    }
}
