//
//  StoriesView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(StorieModel.stories, id: \.name) { storie in
                    StoriesItemView(model: storie)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
        }
        .overlay(
            CustomDividerView(),
            alignment: .bottom
        )

    }
}

#Preview {
    StoriesView()
}
