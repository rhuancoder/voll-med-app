//
//  RequestError.swift
//  Vollmed
//
//  Created by Rhuan Carvalho on 17/05/26.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
    case custom(_ error: [String: Any])
    
    var customMessage: String {
        switch self {
        case .decode:
            return "erro de decodificação"
        case .unauthorized:
            return "sessão expirada"
        default:
            return "erro desconhecido"
        }
    }
}
