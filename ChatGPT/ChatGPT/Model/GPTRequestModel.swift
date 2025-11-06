//
//  GPTRequestModel.swift
//  ChatGPT
//
//  Created by Vagner Reis on 05/11/25.
//

import Foundation

struct GPTRequestModel: Encodable {
    let input: String
    let model: String
    
    init(input: String, model: String = "gpt-5") {
        self.input = input
        self.model = model
    }
}
