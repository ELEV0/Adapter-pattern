//
//  GoogleAuthenticatorAdapter.swift
//  Adapter
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class GoogleAuthenticatorAdapter: AuthorizationService {
    
    private var authentificator = GoogleAuthorization()
    
    func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void) {
        
        authentificator.login(email: email, password: password) { (currentUser, error) in
            guard let currentUser = currentUser else {
                failure(error)
                return
            }
            
            let user = User(email: currentUser.email, password: currentUser.password)
            
            let token = Token(value: currentUser.token)
            success(user, token)
        }
    }
}
