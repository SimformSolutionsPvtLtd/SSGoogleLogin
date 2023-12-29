//
//  ViewController.swift
//  GoogleSigninReusabelComponets
//
//  Created by Sumit Goswami on 20/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    let clientId = "158839743101-fglvu614nbop867an33vqdfjh3eoe8b0.apps.googleusercontent.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSigninTapped(_ sender: Any) {
        self.performGoogleSignOut()
        self.performGoogleSignIn()
    }
    
    
    fileprivate func performGoogleSignOut() {
        SSGoogleManager.manager.signOut()
    }
    
    fileprivate func performGoogleSignIn() {
        SSGoogleManager.manager.logInWithGoogle(clientId: clientId, presenting: self) { result in
            switch result {
            case .success(let userData):
                print(userData)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        } didDisconnectBlock: { result in
            switch result {
            case .success(let userData):
                print(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
