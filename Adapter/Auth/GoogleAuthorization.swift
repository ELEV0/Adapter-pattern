//
//  GoogleAuthorization.swift
//  Adapter
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

public struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}

// гугл авторизация, мы ее не видим
public class GoogleAuthorization {
    
    public func login(email: String, password: String, completion: @escaping (GoogleUser?, Error?) -> Void) {
        
        let token = "special-token-value"
        
        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}
