//
//  MainViewModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/11/25.
//

import Foundation

protocol MainViewModel {
    associatedtype Model: CustomModel
    var models: [Model] { get }
}
