//
//  HomeScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @StateObject var navigation = HomeNavigation()
    
    //    init(viewModel: HomeViewModel) {
    //        self._viewModel = StateObject(wrappedValue: viewModel)
    //    }
    
    var story: some View {
        let model = viewModel.currentStorieModel!
        
        return GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                model.storyDetails[viewModel.timelineCurrentIndex].image
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                VStack(spacing: 12) {
                    
                    // MARK: TIMELINE
                    HStack(spacing: 4) {
                        
                        ForEach(model.storyDetails.indices, id: \.self) { index in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 4)
                                    .foregroundStyle(.white.opacity(0.5))
                                    .background(
                                        GeometryReader { geo in
                                            Color.clear.onAppear {
                                                withAnimation(.easeInOut(duration: 3)) {
                                                    viewModel.timelineWidth = geo.size.width
                                                }
                                            }
                                        }
                                    )
                                Capsule()
                                    .frame(height: 4)
                                    .foregroundStyle(.white)
                                    .frame(width: index <= viewModel.timelineCurrentIndex ? viewModel.timelineWidth : 0)
                                    .animation(.easeInOut(duration: 3), value: viewModel.timelineCurrentIndex)
                            }
                        }
                        
                    }.onAppear {
                        viewModel.showStoryAppear(model: model)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            viewModel.hideStory()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white.opacity(0.5))
                                .font(.title3)
                                .bold()
                        }
                    }
                }
                
                .padding(.horizontal, 16)
                .onDisappear(perform: viewModel.showStoryDisappear)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            
        }
        .transition(.asymmetric(
            insertion: .opacity.combined(with: .scale(scale: 0.95)),
            removal: .opacity
        ))
    }
    
    var home: some View {
            GeometryReader { geometry in
                VStack(spacing: 16) {
                    
                    // MARK: Header
                    HeaderView()
                    
                    ScrollView(showsIndicators: false) {
                        // MARK: Stories
                        StoriesView()
                            .padding(.top, 16)
                        // MARK: Banner
                        BannerView(size: geometry.size)
                        
                        Spacer(minLength: 72)
                    }
                    .padding(.top, -16)
                    
                }
                
            }
        .transition(.asymmetric(
            insertion: .opacity.combined(with: .scale(scale: 0.95)),
            removal: .opacity
        ))
    }
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            Group {
                if viewModel.showStory {
                    story
                        .toolbarVisibility(.hidden, for: .tabBar)
                } else {
                    ZStack {
                        home
                            .environmentObject(navigation)
                            .toolbarVisibility(.visible, for: .tabBar)
                    }
                }
            }
            .navigationDestination(for: HomeNavigation.HomePath.self) { path in
                switch path {
                case .home:
                    HomeScreen()
                case .photo:
                    PhotoScreen()
                        .environmentObject(navigation)
                case .share:
                    ShareScreen()
                        .environmentObject(navigation)
                }
            }
        }
    }
    
}

#Preview {
    HomeScreen()
        .environmentObject(HomeViewModel())
}
