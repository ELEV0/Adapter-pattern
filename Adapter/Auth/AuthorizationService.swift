//
//  AuthorizationService.swift
//  Adapter
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

public struct User {
    public let email: String
    public let password: String
}

public struct Token {
    public let value: String
}

public protocol AuthorizationService {
    func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void)
}
