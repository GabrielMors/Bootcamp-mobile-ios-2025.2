//
//  AuthService.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation
import FirebaseAuth

typealias Model = UserModel

struct AuthService: AuthServiceProtocol {
    
    func getCurrentUser(
        complition: @escaping (Result<Model?, AppError>
        ) -> Void) {
        
       let currentUser = Auth.auth().currentUser
        
        guard let currentUser else {
            complition(.success(nil))
            return
        }
        
        let email = currentUser.email
        
        guard let email else {
            complition(.failure(.emailNotFound))
            return
        }
        
        // Logado
        complition(.success(UserModel(email: email)))
    }
    
}

extension AuthService {
    enum AppError: Error {
        case emailNotFound
    }
}
