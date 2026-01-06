//
//  StoriesView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct StoriesView: View {
    
    private var namespace: Namespace.ID
    
    init(namespace: Namespace.ID) {
        self.namespace = namespace
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(StoryModel.stories, id: \.name) { storie in
                    StoriesItemView(
                        namespace: namespace,
                        model: storie
                    )
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
    
    @Previewable @Namespace var namespace
    
    StoriesView(namespace: namespace)
}
