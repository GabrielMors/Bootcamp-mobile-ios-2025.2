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
    
    @Published var bannerIndex: [CGFloat] = []
    @Published var profileIndex: [Int?] = []
    @Published var isFavoriteArray: [Bool] = []
    
    let limit: CGFloat = -100
    let innerPadding: CGFloat = 4
    
    init() {
        for i in 0..<items.count {
            bannerIndex.append(0)
            profileIndex.append(i)
            isFavoriteArray.append(false)
        }
    }

}

