//
//  AuthNavigationViewModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 04/02/26.
//

import Foundation
import Combine
import SwiftUI

class AuthNavigationViewModel: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: AuthNavigationPath) {
        path.append(route)
    }
    
    func back() {
        
        if !path.isEmpty {
            path = NavigationPath()
        }
        
    }
}

extension AuthNavigationViewModel {
    enum AuthNavigationPath {
        case login
        case register
    }
}
