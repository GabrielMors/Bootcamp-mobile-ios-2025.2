//
//  BannerModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 17/12/25.
//

import Foundation
import SwiftUI

struct BannerModel: Hashable {
    let id = UUID().uuidString
    let image: Image
    
    static func == (lhs: BannerModel, rhs: BannerModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
