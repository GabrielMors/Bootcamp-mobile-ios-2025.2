//
//  PendingOperation.swift
//  InstagramClone
//
//  Created by Vagner Reis on 11/02/26.
//

import Foundation

struct PendingOperation<Model: Codable>: Codable {
    let id = UUID().uuidString
    let type: PendingOperationType
    let model: Model
}

enum PendingOperationType: Codable {
    case favorites
    case other
    
    var rawValue: String {
        switch self {
        case .favorites:
            return "favorites"
        case .other:
            return "algo"
        }
    }
}
