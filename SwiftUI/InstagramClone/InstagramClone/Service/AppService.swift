//
//  AppService.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation

typealias Model = Bool

struct AppService: AppServiceProtocol {
    
    private let myUserDefaults: MyUserDetauls
    
    init(myUserDefaults: MyUserDetauls) {
        self.myUserDefaults = myUserDefaults
    }
    
    func fetchData() async throws -> Model {
        // Reqisicao
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        return true
        
    }
    
    func fetchData(complition: @escaping (Result<Model, Error>) -> Void) {
        // Reqisicao
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            myUserDefaults.setIsAuth(true)
            // Se des sucesso com a model no lugar do boolean
            complition(.success(true))
            
            // caso de erro eu lanço
            //complition(.failure(NSError(domain: "com.instagram", code: 10)))
        }
        
    }
    
}

protocol AppServiceProtocol {
    func fetchData() async throws -> Bool
    func fetchData(complition: @escaping (Result<Bool, Error>) -> Void)
}
