//
//  StorieModel.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import Foundation
import SwiftUI

struct StorieModel {
    let image: Image
    let name: String
    let thisIsLive: Bool
    
    init(image: Image, name: String, thisIsLive: Bool = false) {
        self.image = image
        self.name = name
        self.thisIsLive = thisIsLive
    }
    
    static let stories: [StorieModel] = [
        .init(image: .woman1, name: "Maria Angela"),
        .init(image: .woman2, name: "Joana Reis", thisIsLive: true),
        .init(image: .woman3, name: "Ana Maria"),
        .init(image: .woman4, name: "Jessica Almeida"),
        .init(image: .woman5, name: "Bruna Oliveira"),
        .init(image: .woman6, name: "Fernanda Goes")
    ]
    
}

#if DEBUG
extension StorieModel {
    static var mock: StorieModel {
        .init(image: Image.woman1, name: "Algum Nome")
    }
    static var mockWithLive: StorieModel {
        .init(image: Image.woman2, name: "Algum Nome", thisIsLive: true)
    }
}
#endif
