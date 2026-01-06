//
//  HomeScreen.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

// TODO: 1 Cancelar as animacoes quando clicar no botao de fechar
// TODO: 2 Melhorar as animacoes relacionados a transicoes

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @State var timelineWidth: CGFloat = .zero
    @State var timelineCurrentIndex: Int = 0
    @State var totalSeconds: Int = 3
    
    @Namespace var namespace
    
    //    init(viewModel: HomeViewModel) {
    //        self._viewModel = StateObject(wrappedValue: viewModel)
    //    }
    
    var body: some View {
        if viewModel.showStory {
            let model = viewModel.currentStorieModel!
            
            GeometryReader { geometry in
                ZStack(alignment: .topTrailing) {
                    model.storyDetails[timelineCurrentIndex].image
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .matchedGeometryEffect(id: "banner-\(model.id)", in: namespace)
                    
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
                                                        timelineWidth = geo.size.width
                                                    }
                                                    
                                                }
                                            }
                                        )
                                    Capsule()
                                        .frame(height: 4)
                                        .foregroundStyle(.white)
                                        .frame(width: index <= timelineCurrentIndex ? timelineWidth : 0)
                                        .animation(.easeInOut(duration: 3), value: timelineCurrentIndex)
                                }
                            }
                            
                        }.onAppear {
                            
                            let delay = 3
                            
                            for i in 1..<model.storyDetails.count {
                                
                                totalSeconds += delay
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay * i) ) {
                                    timelineCurrentIndex = i
                                    
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(totalSeconds) ) {
                                viewModel.hideStory()
                            }
                           
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
                    .onDisappear {
                        timelineWidth = .zero
                        timelineCurrentIndex = 0
                        totalSeconds = 3
                    }


                }
                .frame(width: geometry.size.width, height: geometry.size.height)

            }

            
        } else {
            NavigationStack {
                GeometryReader { geometry in
                    VStack(spacing: 16) {
                        
                        // MARK: Header
                        HeaderView()
                        
                        ScrollView(showsIndicators: false) {
                            // MARK: Stories
                            StoriesView(namespace: namespace)
                                .padding(.top, 16)
                            // MARK: Banner
                            BannerView(size: geometry.size)
                            
                            Spacer(minLength: 72)
                        }
                        .padding(.top, -16)
                        
                    }
                    //.animation(.easeInOut, value: viewModel.showStory)
                    
                }
            }
        }
    }
    
}

#Preview {
    HomeScreen()
        .environmentObject(HomeViewModel())
}

