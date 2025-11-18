//
//  HomeViewModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/11/25.
//

import Foundation

class HomeViewModel: MainViewModel {
    
    var models: [CarModel]
    
    private(set) var userModel: UserModel?
    
    init() {
        
        let models: [CarModel] = [
            CarModel(year: 1998, name: "Chevete", imageURL: ""),
            CarModel(year: 1993, name: "Opala", imageURL: "")
        ]
        
        self.models = models
        
    }
    
    func setUserModel(_ model: UserModel) {
        userModel = model
    }

}

