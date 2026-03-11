//
//  NoteModel.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation

struct NoteModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
    let token: TokenModel
}
