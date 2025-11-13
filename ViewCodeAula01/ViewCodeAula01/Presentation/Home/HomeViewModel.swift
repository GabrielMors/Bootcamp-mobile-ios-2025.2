//
//  HomeViewModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/11/25.
//

import Foundation

class HomeViewModel: ViewModel {
    
    typealias Model = CarModel
    
    var wrapper: WrapperModel<Model>
    
    required init(wrapper: WrapperModel<Model>) {
        self.wrapper = wrapper
    }
 
}

