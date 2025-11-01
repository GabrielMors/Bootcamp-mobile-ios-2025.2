//
//  User.swift
//  CodableEEncodable
//
//  Created by Vagner Reis on 30/10/25.
//

import Foundation

struct User: Codable {
    let name: String
    let dateOfBirth: String
    let address: Address
    
    enum CodingKeys: String, CodingKey {
        case name
        case dateOfBirth = "date_of_birth"
        case address
    }
}
