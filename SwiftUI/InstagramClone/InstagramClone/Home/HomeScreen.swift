//
//  HomeScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

// TODO: 1 Substituir o cabecalho por um do swift
// TODO: 2 Adicionar sec, com List

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    //    init(viewModel: HomeViewModel) {
    //        self._viewModel = StateObject(wrappedValue: viewModel)
    //    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 16) {
                    
                    // MARK: Header
                    HeaderView()
                    
                    ScrollView(showsIndicators: false) {
                        // MARK: Stories
                        StoriesView()
                            .padding(.top, 16)
                        // MARK: Banner
                        BannerView(size: geometry.size)
                        
                        Spacer(minLength: 72)
                    }
                    .padding(.top, -16)
                    
                }
            }
        }
    }
    
}

#Preview {
    HomeScreen()
        .environmentObject(HomeViewModel())
}
