//
//  MoreScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import SwiftUI
import FirebaseAuth

struct MoreScreen: View {
    
    @EnvironmentObject var sharedNavViewModel: SharedNavigationViewModel
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        
        Button {
             sharedNavViewModel.navPath = .home
        } label: {
            
            Text("Voltar para a home")
        }
        
        Button {
            do {
                try Auth.auth().signOut()
                appViewModel.uiState = .login
            } catch {
                print("Erro ao tentar sair", error)
            }
            
        } label: {
            
            Text("Sair")
        }
        
    }
}

#Preview {
    MoreScreen()
        .environmentObject(SharedNavigationViewModel())
        .environmentObject(AppViewModel())
}
