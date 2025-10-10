//
//  CarModel.swift
//  CollectionViewProject
//
//  Created by Vagner Reis on 09/10/25.
//

import Foundation
import UIKit

struct CarModel {
    let name: String
    let image: UIImage?
    
    // TODO: Tafefa 3
    // Isso se repete d+
    // Da pra resolver com iteraçao
    static var favoriteMock: ReturnCarModel {
        ("Favoritos", [
            CarModel(name: "Carro 1", image: UIImage(named: "car02")),
            CarModel(name: "Carro 2", image: UIImage(named: "car01"))
        ])
    }
    
    // TODO: Tafefa 3
    // Isso se repete d+
    // Da pra resolver com iteraçao
    static var allMock: ReturnCarModel {
        ("Todos os carros", [
            CarModel(name: "Carro 1", image: UIImage(named: "car01")),
            CarModel(name: "Carro 2", image: UIImage(named: "car02")),
            CarModel(name: "Carro 3", image: UIImage(named: "car03")),
            CarModel(name: "Carro 4", image: UIImage(named: "car04")),
            CarModel(name: "Carro 5", image: UIImage(named: "car05")),
            CarModel(name: "Carro 6", image: UIImage(named: "car06")),
            CarModel(name: "Carro 7", image: UIImage(named: "car07")),
            CarModel(name: "Carro 8", image: UIImage(named: "car08"))
        ])
    }
    
    // TODO: Tafefa 4
    // Ordenar por header, pode usar extension igual ao exemplo
//    static var <#outroModele#>: ReturnCarModel {
//        ("Todos os carros", [
//            CarModel(name: "Carro 1", image: UIImage(named: "car01")),
//            CarModel(name: "Carro 2", image: UIImage(named: "car02")),
//            CarModel(name: "Carro 3", image: UIImage(named: "car03"))
//        ])
//    }
}
