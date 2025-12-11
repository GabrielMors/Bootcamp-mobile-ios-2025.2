//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

@main
struct InstagramCloneApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(viewModel)
        }
    }
}
