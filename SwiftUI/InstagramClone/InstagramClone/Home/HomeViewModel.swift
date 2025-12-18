//
//  HomeViewModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 11/12/25.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    let items: Array<ProfileModel> = ProfileModel.items
    
    @Published var currentIndexArray: [CGFloat] = []
    
    @Published var offesetXArray: [CGFloat] = []
    @Published var heightContainer: CGFloat = .zero
    
    let limit: CGFloat = -100
    let innerPadding: CGFloat = 4
    
    init() {
        for i in 0..<items.count {
            offesetXArray.append(CGFloat(i))
            currentIndexArray.append(0)
        }
    }
    
    func onChnaged(
        gesture: DragGesture.Value,
        geometry: GeometryProxy,
        index: Int
    ) {
        guard currentIndexArray[index] < CGFloat(items[index].banners.count - 1), gesture.translation.width < 0 else { return }
        
        let screenWidth = geometry.size.width + innerPadding
         
        offesetXArray[index] = gesture.translation.width + -(currentIndexArray[index] * screenWidth)
    }
    
    func onEnded(geometry: GeometryProxy, index: Int) {
        
        guard currentIndexArray[index] < CGFloat(items[index].banners.count - 1) else { return }
        
        let screenWidth = geometry.size.width + innerPadding // "= 400"
        
        if offesetXArray[index] > limit {
            withAnimation {
                offesetXArray[index] = 0
            }
        } else {
            
            currentIndexArray[index] += 1
            
            withAnimation {
                offesetXArray[index] = -(screenWidth * currentIndexArray[index])
            }
        }
    }
    
    func setHeightContainer(geometry: GeometryProxy) {
        heightContainer = geometry.size.width + 60
    }
}

