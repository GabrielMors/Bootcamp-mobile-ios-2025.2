//
//  StorieModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import Foundation
import SwiftUI

struct StoryDetails {
    let image: Image
}

struct StoryModel {
    let id = UUID().uuidString
    let image: Image
    let name: String
    let thisIsLive: Bool
    let storyDetails: [StoryDetails]
    
    private init(image: Image, name: String, storyDetails: [StoryDetails], thisIsLive: Bool = false) {
        self.image = image
        self.name = name
        self.thisIsLive = thisIsLive
        self.storyDetails = storyDetails
    }
    
    static let stories: [StoryModel] = [
        .init(image: .woman1, name: "Maria Angela", storyDetails: [
            .init(image: .woman1)
        ]),
        .init(image: .woman2, name: "Joana Reis", storyDetails: [
            .init(image: .woman4),
            .init(image: .woman1),
            .init(image: .woman2),
            .init(image: .woman3)
        ], thisIsLive: true),
        .init(image: .woman3, name: "Ana Maria", storyDetails: [
            .init(image: .woman2),
            .init(image: .woman3),
            .init(image: .woman2)
        ]),
        .init(image: .woman4, name: "Jessica Almeida", storyDetails: [
            .init(image: .woman1),
            .init(image: .woman3),
            .init(image: .woman2)
        ]),
        .init(image: .woman5, name: "Bruna Oliveira", storyDetails: [
            .init(image: .woman1),
            .init(image: .woman3),
            .init(image: .woman2)
        ]),
        .init(image: .woman6, name: "Fernanda Goes", storyDetails: [
            .init(image: .woman1),
            .init(image: .woman3),
            .init(image: .woman2)
        ])
    ]
    
}

#if DEBUG
extension StoryModel {
    static var mock: StoryModel {
        .init(image: Image.woman1, name: "Algum Nome", storyDetails: [.init(image: .woman1), .init(image: .woman2), .init(image: .woman3)])
    }
    static var mockWithLive: StoryModel {
        .init(image: Image.woman2, name: "Algum Nome", storyDetails: [], thisIsLive: true)
    }
}
#endif
