//
//  PhotoScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 19/01/26.
//

import Foundation
import SwiftUI

struct PhotoScreen: View {
    
    @EnvironmentObject var navigation: HomeNavigation
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello, PhotoScreen!")
            
            Button {
                navigation.back()
            } label: {
                Text("Voltar paga home")
            }

            
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Photo Screen")
    }
}

#Preview {
    PhotoScreen()
        .environmentObject(HomeNavigation())
}
