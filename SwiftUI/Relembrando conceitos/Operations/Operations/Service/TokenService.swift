//
//  TokenService.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation

struct TokenService {
    
    private let token = "66b82dde7e257f93c10859e4eb5a0f6c67c443c13193663e2472b8da8e6b1c6b"
    
    func getToken() -> TokenModel {
        sleep(2) // Seria busca no backendm e/ou servico externo
        saveLocal()
        return .init(accesstoken: token)
    }
    
    private func saveLocal() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "accesstoken")
        defaults.set(token, forKey: "accesstoken")
    }
    
}
