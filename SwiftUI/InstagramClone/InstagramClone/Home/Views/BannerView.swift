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
    
    @State var offesetX: CGFloat = .zero
    @Binding var currentIndex: CGFloat
    @State var heightContainer: CGFloat = .zero
    
    private let limit: CGFloat = -100
    private let innerPadding: CGFloat = 4
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                
                // Container
                HStack(spacing: innerPadding) {
                    Image.woman1
                        .resizable()
                        .frame(width: geometry.size.width, height: heightContainer)
                     
                    Image.woman2
                        .resizable()
                        .frame(width: geometry.size.width, height: heightContainer)
                    
                    Image.woman3
                        .resizable()
                        .frame(width: geometry.size.width, height: heightContainer)
                }
                .offset(x: offesetX)
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            
                            guard currentIndex < 2, gesture.translation.width < 0 else { return }
                            
                            let screenWidth = geometry.size.width + innerPadding
                             
                            offesetX = gesture.translation.width + -(currentIndex * screenWidth)
                        })
                        .onEnded({ _ in
                            
                            guard currentIndex < 2 else { return }
                            
                            let screenWidth = geometry.size.width + innerPadding // "= 400"
                            
                            if offesetX > limit {
                                withAnimation {
                                    offesetX = 0
                                }
                            } else {
                                
                                currentIndex += 1
                                
                                withAnimation {
                                    offesetX = -(screenWidth * currentIndex)
                                }
                            }
                            
                        })
                )
                
                Capsule()
                    .frame(width: 34, height: 26)
                    .overlay(content: {
                        Text("\(Int(currentIndex + 1))/3")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .animation(.easeInOut, value: currentIndex)
                    })
                    .offset(x: geometry.size.width - 44, y: 16)
            }.onAppear {
                heightContainer = geometry.size.width + 60
            }
        } // end geometry
        .frame(height: heightContainer)
    }
}

#Preview {
    BannerView(currentIndex: .constant(0))
}
