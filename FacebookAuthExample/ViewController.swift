//
//  ViewController.swift
//  FacebookAuthExample
//
//  Created by Synergy on 05/03/18.
//  Copyright © 2018 Synergy.com.nl. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var customfacebookButtonLogin: UIButton!
    @IBOutlet weak var facebookButtonLogin: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookButtonLogin.delegate = self
        facebookButtonLogin.readPermissions = ["public_profile", "email"]
    
        customfacebookButtonLogin.addTarget(self, action:#selector(loginButtonClicked), for: .touchUpInside)
    }

    func loginButtonClicked() {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile"], from: self) { result, error in

            if error != nil {
                return
            }
            guard let res = result else {
                return
            }
            if res.isCancelled {
                return
            }
            if let token = res.token.tokenString {
                dump("loginButton")
                print("Access Token: ")
            dump(token)
            }
            
        }
    }


}

extension ViewController: FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let accessToken = FBSDKAccessToken.current() {
            dump("loginButton")
            print("Access Token: ")
            
            dump(accessToken)
        } else {
            dump("loginButton")
        }
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        dump("loginButtonDidLogOut")
    }
}
