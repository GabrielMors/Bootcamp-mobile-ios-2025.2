//
//  ProfileModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 17/12/25.
//

import Foundation
import SwiftUI

struct ProfileModel: Hashable {
    let id = UUID().uuidString
    let banners: [BannerModel]
    let name: String
    let city: String
    let personImage: Image
    
    static func == (lhs: ProfileModel, rhs: ProfileModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static var items: Array<ProfileModel> {
        return [
            ProfileModel(banners: [
                .init(image: Image.woman1),
                .init(image: Image.woman2),
                .init(image: Image.woman3)
            ], name: "josei_l", city: "Japan, Tokio", personImage: .woman2),
            ProfileModel(banners: [
                .init(image: Image.woman4),
                .init(image: Image.woman5),
                .init(image: Image.woman6),
                .init(image: Image.woman1)
            ], name: "anie_i", city: "Brazil, Sao Paulo", personImage: .woman4)
            
        ]
    }
}
