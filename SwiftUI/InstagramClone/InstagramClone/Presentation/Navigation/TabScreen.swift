//
//  TabScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import SwiftUI

struct TabScreen: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    @EnvironmentObject var sharedNavViewModel: SharedNavigationViewModel
    
    var body: some View {
        TabView(selection: $sharedNavViewModel.navPath) {
            Tab("Home", systemImage: "house", value: .home) {
                HomeScreen()
                    .environmentObject(viewModel)
            }
            
            Tab("Search", systemImage: "magnifyingglass", value: .search) {
                Text("Search")
            }

            Tab("More", systemImage: "plus.app", value: .more) {
                MoreScreen()
            }
            
            Tab("Favorite", systemImage: "heart", value: .favorite) {
                Text("Favorite")
            }
            
            Tab("Profile", systemImage: "photo.artframe.circle.fill", value: .profile) {
                Text("profile")
            }
        }
    }
}

#Preview {
    TabScreen()
        .environmentObject(SharedNavigationViewModel())
}
