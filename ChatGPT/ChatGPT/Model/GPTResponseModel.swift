//
//  GPTResponseModel.swift
//  ChatGPT
//
//  Created by Vagner Reis on 05/11/25.
//

import Foundation

struct GPTResponseModel: Decodable {
    let id: String
    let output: [GPTOutputResponseModel]
    
    struct GPTOutputResponseModel: Decodable {
        let id: String
        let content: [GPTContentResponseModel]?
    }
    
    struct GPTContentResponseModel: Decodable {
        let text: String
    }
    
    enum CodingKeys: CodingKey {
        case id
        case output
    }
    
    // Esse init que trata os codables
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.output = try container.decode([GPTResponseModel.GPTOutputResponseModel].self, forKey: .output)
//    }
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case output
//    }
}
