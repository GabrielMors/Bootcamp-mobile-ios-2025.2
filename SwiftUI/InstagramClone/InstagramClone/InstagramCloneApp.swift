//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI
import FirebaseAuth

// TODO: Customizar a tabbar (nao precisar ser uma custumizada) usando TabView

@main
struct InstagramCloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var sharedNavViewModel = SharedNavigationViewModel()
    
    @StateObject private var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            Group {
                switch appViewModel.uiState {
                case .idle:
                    ZStack {
                        LaunchScreenLoading()
                        ProgressView {
                            Text("Carregando...")
                        }
                        .offset(y: 128 / 2 + 32)
                    }
                    .onAppear {
                        appViewModel.fetchData()
                    }
                    .ignoresSafeArea()
                case .auth:
                    TabScreen()
                        .environmentObject(sharedNavViewModel)
                        .environmentObject(appViewModel)
                case .login:
                    Button {
                        
                        Auth.auth().signIn(withEmail: "vagner.reis@gmail.com", password: "123456")
                        
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
