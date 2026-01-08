//
//  StoriesItemView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct StoriesItemView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    private let model: StoryModel
    
    init(model: StoryModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            
            ZStack {
                Circle()
                    .foregroundStyle(LinearGradient.customLinearGradient)
                    .frame(width: 62)
                
                ZStack(alignment: .bottom) {
                    model.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 58, height: 58)
                        .clipShape(Circle())
                    
                    if model.thisIsLive {
                        LiveView()
                            .offset(y: 8)
                    }
                }
                
            }
            .onTapGesture {
                viewModel.showStory(withModel: model)
            }
            
            Text(model.name)
                .font(.footnote)
                .padding(.top, 2)
        }
    }
}

#if DEBUG
#Preview {
    
    StoriesItemView(
        model: .mock
    )
    .environmentObject(HomeViewModel())
    
    StoriesItemView(
        model: .mockWithLive
    )
    .environmentObject(HomeViewModel())
}
#endif
