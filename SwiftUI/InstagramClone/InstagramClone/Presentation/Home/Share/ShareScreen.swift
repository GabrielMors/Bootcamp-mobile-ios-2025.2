//
//  ShareScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 19/01/26.
//

import Foundation
import SwiftUI

struct ShareScreen: View {
    
    @EnvironmentObject var navigation: HomeNavigation
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello, ShareScreen!")
            
            Button {
                navigation.back()
            } label: {
                Text("Voltar paga home")
            }

            
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("ShareScreen")
    }
}

#Preview {
    PhotoScreen()
        .environmentObject(HomeNavigation())
}
