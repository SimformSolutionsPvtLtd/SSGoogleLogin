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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        LoginManager.shared.googleManager?.uiDelegate = self
        LoginManager.shared.logInWithGoogle(clientId: "158839743101-fglvu614nbop867an33vqdfjh3eoe8b0.apps.googleusercontent.com", complitionBlock: { (userData, error) in
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
}
extension ViewController:GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {

    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {

    }
}

