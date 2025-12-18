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
    
    @State var totalPostsheight: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ForEach(Array(homeViewModel.items.enumerated()), id: \.element) { indexMatriz, profile in
                    VStack(alignment: .leading) {
                        
                        PostView(profile: profile)
                            .overlay {
                                GeometryReader { geo in
                                    Color.clear
                                        .onAppear {
                                            totalPostsheight += geo.size.height
                                        }
                                }
                            }
                        
                        ZStack(alignment: .topLeading) {
                            
                            // Container
                            HStack(spacing: homeViewModel.innerPadding) {
                                
                                ForEach(Array(profile.banners.enumerated()), id: \.element) { indexItem, item in
                                    item.image
                                        .resizable()
                                        .frame(width: geometry.size.width, height: homeViewModel.heightContainer)
                                    
                                }
                                
                            }
                            .offset(x: homeViewModel.offesetXArray[indexMatriz])
                            .simultaneousGesture(
                                DragGesture()
                                    .onChanged({
                                        homeViewModel.onChnaged(gesture: $0, geometry: geometry, index: indexMatriz)
                                    })
                                    .onEnded({ _ in
                                        homeViewModel.onEnded(geometry: geometry, index: indexMatriz)
                                    })
                            )
                            
                            Capsule()
                                .frame(width: 34, height: 26)
                                .overlay(content: {
                                    Text("\(Int(homeViewModel.currentIndexArray[indexMatriz] + 1))/\(profile.banners.count)")
                                        .foregroundStyle(.white)
                                        .font(.footnote)
                                        .animation(.easeInOut, value: homeViewModel.currentIndexArray[indexMatriz])
                                })
                                .offset(x: geometry.size.width - 44, y: 16)
                        }
                        
                        DetailsView()
                            .overlay {
                                GeometryReader { geo in
                                    Color.clear
                                        .onAppear {
                                            totalPostsheight += geo.size.height
                                        }
                                }
                            }
                        
                    }
                    .padding(
                        .top, indexMatriz == 0 ? 0 : 16
                    )
                }.onAppear {
                    homeViewModel.setHeightContainer(geometry: geometry)
                }
            }
        } // end geometry
        .frame(height: (homeViewModel.heightContainer * CGFloat(homeViewModel.items.count) + totalPostsheight))
    }
}

#Preview {
    ScrollView {
        BannerView()
            .environmentObject(HomeViewModel())
    }
}
