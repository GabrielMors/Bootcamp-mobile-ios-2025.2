//
//  HomeNavigation.swift
//  InstagramClone
//
//  Created by Vagner Reis on 19/01/26.
//

import Foundation
import Combine

import SwiftUI

class HomeNavigation: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func navigate(to route: HomePath) {
        path.append(route)
    }
    
    func back() {
        if !path.isEmpty {
            path = NavigationPath()
        }
    }
    
}

extension HomeNavigation {
    enum HomePath: String, Equatable, CaseIterable {
        case home
        case photo
        case share
    }
}
