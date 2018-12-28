//
//  TwitterAuthorization.swift
//  Adapter
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

public struct TwitterUser {
    public var email: String
    public var password: String
    public var token: String
}

public class TwitterAuthorization {
    public func login(email: String, password: String, completion: @escaping (TwitterUser?, Error?) -> Void) {
        
        let token = "special-token-value"
        
        let user = TwitterUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}
