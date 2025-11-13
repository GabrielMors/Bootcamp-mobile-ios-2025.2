//
//  CounterViewModel.swift
//  ViewModel
//
//  Created by Vagner Reis on 12/11/25.
//

import Foundation

struct CounterViewModel {
    
    fileprivate var limit = 10
    // Composicao
    private var model = CounterModel()
    
    var onCountChange: ( (Int) -> Void )?
    
    mutating func increment() {
        if model.count < limit {
            model.count += 1
            onCountChange?(model.count)
        }
    }
    
    mutating func decrease() {
        if model.count > 0 {
            model.count -= 1
            onCountChange?(model.count)
        }
    }
    
}


