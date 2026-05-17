//
//  AuthenticationNetworkingService.swift
//  Vollmed
//
//  Created by Rhuan Carvalho on 17/05/26.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError>
}

struct AuthenticationNetworkingService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.logout, responseModel: nil)
    }
}
