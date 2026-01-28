//
//  AppViewModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation
import Combine
import FirebaseAuth

@MainActor
class AppViewModel: ObservableObject {
    
    @Published var uiState: UIState = .idle
    
    private let myUserDefaults: MyUserDetauls
    
    private let service: AppServiceProtocol
    
    @Published var isLoading: Bool = false
    
    @Published private(set) var loginErrorMessage: String?
    
    init() {
        myUserDefaults = MyUserDetauls()
        self.service = AppService(myUserDefaults: myUserDefaults)
    }
    
    //    func fetchData() {
    //        uiState = .loading
    //
    //        Task {
    //            await service.fetchData()
    //            self.uiState = .auth
    //        }
    //    }
    
    func fetchData() {
        
        service.fetchData { result in
            
            self.isLoading = false
            
            switch result {
            case .success(let model):
                
                if let _ = model {
                    self.uiState = .auth
                    return
                }
                
                self.uiState = .login
                
            case .failure(let error):
                self.uiState = .error(error.localizedDescription)
            }
            
        }
    }
    
    func login(
        withEmail email: String,
        andPaswword password: String
    ) {
         isLoading = true
        
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { result, error in
            
            if let error {
                self.loginErrorMessage = error.localizedDescription
                self.isLoading = false
                return
            }
            
            self.fetchData()

        }
    }
    
    func clearError() {
        loginErrorMessage = nil
    }
    
}


extension AppViewModel {
    enum UIState: Equatable {
        case idle
        case auth
        case login
        case error(String)
    }
}
