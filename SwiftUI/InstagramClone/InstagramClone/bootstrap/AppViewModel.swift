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
    
    private let authService: AuthServiceProtocol
    
    @Published var isLoading: Bool = false
    
    @Published private(set) var loginErrorMessage: String?
    
    init() {
        self.authService = AuthService()
    }
    
    func fetchData() {
        
        authService.getCurrentUser { result in
            
            self.isLoading = false
            
            switch result {
            case .success(let model):
                
                if let model {
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
            
            if self.showError(error) {
                DatabaseService.Logs.shared.writeLog(
                    logMessage: "Erro ao tentar fazer login, causa: \(String(describing: error))",
                    ofType: .warning
                )
                return
            }
            
            DatabaseService.Logs.shared.writeLog(
                logMessage: "O usuário \(email) acabou de fazer login",
                ofType: .info
            )
            
            self.fetchData()
            
        }
    }
    
    func register(
        withEmail email: String,
        password: String,
        repeatPassword: String
    ) {
        
        if !password.elementsEqual(repeatPassword) {
            loginErrorMessage = "As senhas nao batem"
            return
        }
        
        isLoading = true
        
        Auth.auth().createUser(
            withEmail: email,
            password: password
        ) { result, error in
            
            if self.showError(error) {
                return
            }
            
            self.fetchData()
        }
        
    }
    
    func clearError() {
        loginErrorMessage = nil
    }
    
    private func showError(_ error: Error?) -> Bool {
        if let error {
            self.loginErrorMessage = error.localizedDescription
            self.isLoading = false
            return true
        }
        
        return false
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
