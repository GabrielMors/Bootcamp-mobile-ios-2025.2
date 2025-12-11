//
//  BannerView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

// 400 * 3 = 1200
// trailing = 600

struct BannerView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                
                // Container
                HStack(spacing: homeViewModel.innerPadding) {
                    
                    ForEach(Array(homeViewModel.modelos.enumerated()), id: \.element) { index, modelo in
                        modelo.image
                            .resizable()
                            .frame(width: geometry.size.width, height: homeViewModel.heightContainer)
                    }
                    
                }
                .offset(x: homeViewModel.offesetX)
                .gesture(
                    DragGesture()
                        .onChanged({
                            homeViewModel.onChnaged(gesture: $0, geometry: geometry)
                        })
                        .onEnded({ _ in
                            homeViewModel.onEnded(geometry: geometry)
                        })
                )
                
                Capsule()
                    .frame(width: 34, height: 26)
                    .overlay(content: {
                        Text("\(Int(homeViewModel.currentIndex + 1))/\(homeViewModel.modelos.count)")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .animation(.easeInOut, value: homeViewModel.currentIndex)
                    })
                    .offset(x: geometry.size.width - 44, y: 16)
            }.onAppear {
                homeViewModel.setHeightContainer(geometry: geometry)
            }
        } // end geometry
        .frame(height: homeViewModel.heightContainer)
    }
}

#Preview {
    BannerView()
        .environmentObject(HomeViewModel())
}
