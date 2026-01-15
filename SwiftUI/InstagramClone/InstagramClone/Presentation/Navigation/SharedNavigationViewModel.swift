//
//  SharedNavigationViewModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation
import Combine

class SharedNavigationViewModel: ObservableObject {
    
    @Published var navPath: TabNavigationPath = .home
    
}
