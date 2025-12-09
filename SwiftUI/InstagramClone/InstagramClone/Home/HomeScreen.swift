//
//  HomeScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct HomeScreen: View {
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
            BannerView()
            
            Spacer()
            
        } // END: Container
    }
    
}

#Preview {
    HomeScreen()
}
