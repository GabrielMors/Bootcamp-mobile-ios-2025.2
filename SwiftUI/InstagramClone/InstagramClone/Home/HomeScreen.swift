//
//  HomeScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

// TODO: 1 - Voltar as imagens
// TODO: 2 @Namespace - Para fazer anim dos pontos DOTS

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    //    init(viewModel: HomeViewModel) {
    //        self._viewModel = StateObject(wrappedValue: viewModel)
    //    }
    
    var body: some View {
        // MARK: Container
        VStack(spacing: 16) {
            
            // MARK: Header
            HeaderView()
            
            ScrollView {
                // MARK: Stories
                StoriesView()
                    .padding(.top, 16)
                // MARK: Post
                PostView()
                // MARK: Banner
                BannerView()
                
                DetailsView()
                
                Spacer(minLength: 48)
            }
            .padding(.top, -16)
            
            
        } // END: Container
    }
    
}

#Preview {
    HomeScreen()
        .environmentObject(HomeViewModel())
}
