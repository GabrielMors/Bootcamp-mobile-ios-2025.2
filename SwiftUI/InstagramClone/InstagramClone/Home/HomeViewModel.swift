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
    
    let modelos = Modelo.modelos()
    
    @Published var currentIndex: CGFloat = 0
    
    @Published var offesetX: CGFloat = .zero
    @Published var heightContainer: CGFloat = .zero
    
    let limit: CGFloat = -100
    let innerPadding: CGFloat = 4
    
    func onChnaged(gesture: DragGesture.Value, geometry: GeometryProxy) {
        guard currentIndex < CGFloat(modelos.count - 1), gesture.translation.width < 0 else { return }
        
        let screenWidth = geometry.size.width + innerPadding
         
        offesetX = gesture.translation.width + -(currentIndex * screenWidth)
    }
    
    func onEnded(geometry: GeometryProxy) {
        
        guard currentIndex < CGFloat(modelos.count - 1) else { return }
        
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
    }
    
    func setHeightContainer(geometry: GeometryProxy) {
        heightContainer = geometry.size.width + 60
    }
}


struct Modelo: Hashable {
    let id = UUID().uuidString
    let image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    static func == (lhs: Modelo, rhs: Modelo) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func modelos() -> [Self] {
        return [
            .init(image: Image.woman1),
            .init(image: Image.woman2),
            .init(image: Image.woman3)
        ]
    }
}


