//
//  ProfileModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 17/12/25.
//

import Foundation
import SwiftUI

struct ProfileModel: Hashable, Codable {
    let id: String
    let banners: [BannerModel]
    let name: String
    let city: String
    let personImage: String
    
    static func == (lhs: ProfileModel, rhs: ProfileModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

struct SyncFavoriteModel: Hashable, Codable {
    let isFavorite: Bool
    let profileModel: ProfileModel
}
