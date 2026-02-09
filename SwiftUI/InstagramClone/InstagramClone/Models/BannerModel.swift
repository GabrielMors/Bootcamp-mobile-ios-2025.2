//
//  BannerModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 17/12/25.
//

import Foundation
import SwiftUI

struct BannerModel: Hashable, Decodable {
    let image: String
    
    static func == (lhs: BannerModel, rhs: BannerModel) -> Bool {
        lhs.image == rhs.image
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(image)
    }
}
