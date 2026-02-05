//
//  AppService.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation
import FirebaseAuth

typealias Model = UserModel

struct AppService: AppServiceProtocol {
    
    private let myUserDefaults: MyUserDetauls
    
    init(myUserDefaults: MyUserDetauls) {
        self.myUserDefaults = myUserDefaults
    }
    
    func fetchData() async throws -> Model? {
        // Reqisicao
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        return UserModel(email: "")
        
    }
    
    func fetchData(complition: @escaping (Result<Model?, AppError>) -> Void) {
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

protocol AppServiceProtocol {
    func fetchData() async throws -> Model?
    func fetchData(complition: @escaping (Result<Model?, AppService.AppError>) -> Void)
}

extension AppService {
    enum AppError: Error {
        case emailNotFound
    }
}
