//
//  PostView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        
        HStack {
            
            Image.woman4
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(.circle)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text("joshua_l")
                        .font(.callout)
                        .bold()
                    
                    Image.officialIcon
                }
                Text("Tokyo, Japan")
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
    PostView()
}
