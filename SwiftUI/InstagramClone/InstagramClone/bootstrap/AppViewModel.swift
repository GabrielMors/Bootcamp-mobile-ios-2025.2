//
//  AppViewModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation
import Combine

@MainActor
class AppViewModel: ObservableObject {
    
    @Published var uiState: UIState = .idle
    
    private let myUserDefaults: MyUserDetauls
    
    private let service: AppServiceProtocol
    
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
    
}


extension AppViewModel {
    enum UIState: Equatable {
        case idle
        case auth
        case login
        case error(String)
    }
}
