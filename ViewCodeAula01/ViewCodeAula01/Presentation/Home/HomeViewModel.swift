//
//  HomeViewModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/11/25.
//

import Foundation

class HomeViewModel {
    
    private let cars: [CarModel]
    
    private(set) var user: UserModel?
    
    var numberOfRows: Int {
        cars.count
    }
    
    init(cars: [CarModel]) {
        self.cars = cars
    }
    
    func setUser(_ user: UserModel) {
        self.user = user
    }
    
    func cellModel(at index: Int) -> CarModel {
        return cars[index]
    }

}

