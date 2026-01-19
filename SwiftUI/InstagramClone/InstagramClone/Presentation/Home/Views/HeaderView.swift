//
//  HeaderView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var navigation: HomeNavigation
    
    var body: some View {
        ZStack {
            
            HStack {
                Button {
                    navigation.navigate(to: .photo)
                } label: {
                    Image.cameraIcon
                }

                Spacer()
                HStack(spacing: 16) {
                    Image.igtv
                    Button {
                        navigation.navigate(to: .share)
                    } label: {
                        Image.messanger
                    }

                }
            } // END: Header
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
            .overlay(
                CustomDividerView(),
                alignment: .bottom
            )
            
            Image.instagramLogo
            
            
        }
        .background(.whiteSnow)
    }
}

#Preview {
    HeaderView()
        .environmentObject(HomeNavigation())
}
