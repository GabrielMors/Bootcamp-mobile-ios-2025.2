//
//  HeaderView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            
            HStack {
                Button {
                     print("Click cameraIcon")
                } label: {
                    Image.cameraIcon
                }

                Spacer()
                HStack(spacing: 16) {
                    Image.igtv
                    Image.messanger
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
}
