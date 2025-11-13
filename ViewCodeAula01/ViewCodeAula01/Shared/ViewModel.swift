//
//  ViewModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/11/25.
//

import Foundation

protocol ViewModel {
    associatedtype Model: CustomModel
    var wrapper: WrapperModel<Model> { get }
    init(wrapper: WrapperModel<Model>)
}
