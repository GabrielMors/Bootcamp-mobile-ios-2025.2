//
//  Model.swift
//  TableView
//
//  Created by Vagner Reis on 06/10/25.
//

import Foundation

struct Model {
    let name: String
    var isFavorite: Bool
    
    init(name: String, isFavorite: Bool = false) {
        self.name = name
        self.isFavorite = isFavorite
    }
    
    static func mock() -> [Self] {
        [
            .init(name: "Pedro"),
            .init(name: "Maria"),
            .init(name: "Alexandre"),
            .init(name: "Aline")
        ]
    }
}
