//
//  ViewController.swift
//  Adapter
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // будет предоставлять yfv по какому-то протоколу или типу какую-то регистрацию
    var authService = GoogleAuthenticatorAdapter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUser(email: "swift@icloud.com", password: "lol")
    }
    
    func createUser(email: String, password: String) {
        authService.login(email: email, password: password, success: { (user, token) in
            print("Auth successed: \(user.email), \(token.value)")
        }) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }


}

