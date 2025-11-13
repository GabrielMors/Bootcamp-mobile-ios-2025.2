//
//  WrapperModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/11/25.
//

import Foundation

struct WrapperModel<Model: CustomModel> {
    
    private(set) var models: [Model] = []
    
    mutating func append(_ model: Model) {
        models.append(model)
    }
    
}

protocol CustomModel: Codable { }
