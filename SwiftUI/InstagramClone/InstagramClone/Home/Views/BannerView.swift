//
//  BannerView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image.banner
                .resizable()
                .scaledToFit()
            
            Capsule()
                .frame(width: 34, height: 26)
                .overlay(content: {
                    Text("1/3")
                        .foregroundStyle(.white)
                        .font(.footnote)
                })
                .offset(x: -12, y: 12)
        }
    }
}

#Preview {
    BannerView()
}
