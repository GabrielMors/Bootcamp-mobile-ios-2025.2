//
//  PostView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct PostView: View {
    
    private let profile: ProfileModel
    
    init(profile: ProfileModel) {
        self.profile = profile
    }
    
    var body: some View {
        
        HStack {
            
            AsyncImage(url: URL(string: profile.personImage)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(.circle)
                    .padding(.trailing, 8)
            } placeholder: {
                ProgressView()
                    .frame(width: 32, height: 32)
            }

            
//            AsyncImage(url: URL(string: profile.personImage)) { phase in
//                switch phase {
//                case .empty:
//                    EmptyView()
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 32, height: 32)
//                        .clipShape(.circle)
//                        .padding(.trailing, 8)
//                case .failure(let error):
//                    EmptyView()
//                @unknown default:
//                    EmptyView()
//                }
//            }
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(profile.name)
                        .font(.callout)
                        .bold()
                    
                    Image.officialIcon
                }
                Text(profile.city)
                    .font(.caption)
                    .fontWeight(.light)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
            
        }
        .padding(.horizontal, 12)
        
    }
}

#Preview {
    PostView(profile: .init(id: "", banners: [], name: "", city: "", personImage: ""))
}
