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
    private let size: CGSize
    
    init(size: CGSize) {
        self.size = size
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                ForEach(Array(homeViewModel.items.enumerated()), id: \.element) { profileIndex, profile in
                    VStack(alignment: .leading) {
                        
                        PostView(profile: profile)
                        
                        ZStack(alignment: .topLeading) {
                            
                            // Container
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: homeViewModel.innerPadding) {
                                    
                                    ForEach(Array(profile.banners.enumerated()), id: \.element) { indexItem, item in
                                        
                                        AsyncImage(url: URL(string: item.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: size.width, height: size.width + (size.width / 6))
                                        .padding(.leading, homeViewModel.profileIndex[profileIndex] == 0 ? 0 : -homeViewModel.innerPadding)
                                        .id(indexItem)
                                        
                                    }
                                    
                                }
                            }
                            .scrollTargetLayout()
                            .scrollTargetBehavior(.paging)
                            .scrollPosition(id: $homeViewModel.profileIndex[profileIndex])
                            
                            Capsule()
                                .frame(width: 34, height: 26)
                                .overlay(content: {
                                    Text("\(Int(homeViewModel.bannerIndex[profileIndex] + 1))/\(profile.banners.count)")
                                        .foregroundStyle(.white)
                                        .font(.footnote)
                                        .animation(.easeInOut, value: homeViewModel.bannerIndex[profileIndex])
                                })
                                .offset(x: size.width - 44, y: 16)
                        }
                        .onChange(of: homeViewModel.profileIndex[profileIndex]) { oldValue, newValue in
                            withAnimation {
                                homeViewModel.bannerIndex[profileIndex] = CGFloat(newValue ?? 0)
                            }
                        }
                        
                        DetailsView(profile: profile, profileIndex: profileIndex)
                        
                    }
                    .padding(
                        .top, profileIndex == 0 ? 0 : 16
                    )
                }
                
            }
        
    }
}

#Preview {
    ScrollView {
        BannerView(size: CGSize(width: UIScreen.main.bounds.width, height: 500))
            .environmentObject(HomeViewModel())
    }
}
