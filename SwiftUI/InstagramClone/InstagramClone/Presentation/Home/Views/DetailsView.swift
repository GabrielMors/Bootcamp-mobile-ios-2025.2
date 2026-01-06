//
//  DetailsView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 11/12/25.
//

import SwiftUI

struct DetailsView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    private let profile: ProfileModel
    private let profileIndex: Int
    
    init(profile: ProfileModel, profileIndex: Int) {
        self.profile = profile
        self.profileIndex = profileIndex
    }
    
    var body: some View {
        VStack {
            // MARK: Sec 1
            ZStack {
                
                HStack(spacing: 1) {
                    ForEach(Array(profile.banners.enumerated()), id: \.element) { index, modelo in
                        Circle()
                            .frame(width: 12, height: 8)
                            .foregroundStyle(Int(homeViewModel.bannerIndex[profileIndex]) == index ? .blue : .gray.opacity(0.6))
                            .animation(.default, value: homeViewModel.bannerIndex)
                    }
                }
                .padding(.top, 8)
                
                HStack {
                    
                    HStack {
                        Button {
                            homeViewModel.isFavoriteArray[profileIndex].toggle()
                        } label: {
                            homeViewModel.isFavoriteArray[profileIndex] ? Image.likeFill : Image.like
                        }

                        Image.comment
                        Image.messanger
                    }
                    
                    Spacer()
                    
                    Image.save
                    
                }
                .padding(.top, 8)
            }
            
            // MARK: sec 2
            
            VStack {
                HStack {
                    Image.woman1
                        .resizable()
                        .frame(width: 26, height: 26)
                        .clipShape(.circle)
                    
                    Text("Liked by ") +
                    Text("craing_love ").bold() +
                    Text("and ") +
                    Text("44,686 others").bold()
                    
                    Spacer()
                }
                
                HStack {
                    Text("joshua_l ").bold() +
                    Text("The game in Japan was amazing and i want to share some photos")
                    Spacer()
                }
                
                
            }
            .padding(.top, 8)
            
        }
        .padding(.horizontal, 12)
        
    }
}

#Preview {
    DetailsView(profile: .init(banners: [], name: "", city: "", personImage: .woman1), profileIndex: 0)
        .environmentObject(HomeViewModel())
}
