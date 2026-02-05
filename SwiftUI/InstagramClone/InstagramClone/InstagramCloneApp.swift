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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var sharedNavViewModel = SharedNavigationViewModel()
    
    @StateObject private var appViewModel = AppViewModel()
    
    @StateObject private var authNavigationViewModel = AuthNavigationViewModel()
    
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
                    NavigationStack(path: $authNavigationViewModel.path) {
                        LoginScreen()
                            .environmentObject(authNavigationViewModel)
                            .environmentObject(appViewModel)
                            .navigationDestination(for: AuthNavigationViewModel.AuthNavigationPath.self) { path in
                                switch path {
                                case .login:
                                    LoginScreen()
                                case .register:
                                    RegisterScreen()
                                        .environmentObject(appViewModel)
                                        .environmentObject(authNavigationViewModel)
                                        .navigationBarBackButtonHidden()
                                }
                            }
                    }
 
                case .error(let errorString):
                    LoginScreen(applicationError: errorString)
                        .environmentObject(appViewModel)
                }
            }
            .animation(.easeInOut, value: appViewModel.uiState)
            
        }
    }
    
}
