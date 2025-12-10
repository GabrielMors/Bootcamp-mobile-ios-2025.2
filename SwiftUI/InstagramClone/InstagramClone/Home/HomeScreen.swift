//
//  HomeScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct Modelo: Hashable {
    let id = UUID().uuidString
}

// TODO: 1 - Voltar as imagens
// TODO: 2 @Namespace - Para fazer anim dos pontos DOTS

struct HomeScreen: View {
    
    @State var currentIndex: CGFloat = 0
    
    let modelos = [Modelo(), Modelo(), Modelo()]
    
    var body: some View {
        // MARK: Container
        VStack(spacing: 16) {
            
            // MARK: Header
            HeaderView()
            // MARK: Stories
            StoriesView()
            // MARK: Post
            PostView()
            // MARK: Banner
            BannerView(currentIndex: $currentIndex)
            
            HStack(spacing: 2) {
                
                ForEach(Array(modelos.enumerated()), id: \.element) { index, modelo in
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 12, height: 8)
                        .foregroundStyle(Int(currentIndex) == index ? .yellow : .gray)
                        .animation(.default, value: currentIndex)
                }

            }
            .padding(.top, 0)
            
            Spacer()
            
        } // END: Container
    }
    
}

#Preview {
    HomeScreen()
}
