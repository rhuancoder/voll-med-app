//
//  Login.swift
//  Vollmed
//
//  Created by Rhuan Carvalho on 15/05/25.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password = "senha"
    }
}

struct LoginResponse: Codable {
    let auth: Bool
    let path: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case auth
        case path = "rota"
        case token
    }
}
