//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

// TODO: Customizar a tabbar (nao precisar ser uma custumizada) usando TabView

@main
struct InstagramCloneApp: App {
    
    @StateObject private var sharedNavViewModel = SharedNavigationViewModel()
    
    @StateObject private var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            Group {
                switch appViewModel.uiState {
                case .idle:
                    Text("IDLE").onAppear {
                        appViewModel.fetchData()
                    }
                case .loading:
                    ProgressView {
                        Text("Carregando")
                    }
                case .auth:
                    TabScreen()
                        .environmentObject(sharedNavViewModel)
                        .environmentObject(appViewModel)
                case .login:
                    Button {
                        appViewModel.fetchData()
                    } label: {
                        Text("Logar")
                    }

                case .error(let errorString):
                     Text(errorString)
                }
            }
            .animation(.easeInOut, value: appViewModel.uiState)
            
        }
    }
}
