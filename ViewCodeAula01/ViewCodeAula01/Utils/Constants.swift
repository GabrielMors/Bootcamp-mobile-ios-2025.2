//
//  Constants.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/10/25.
//

import Foundation

struct Constants {
    
    struct Sizes {
        static var horizontalAppSpacing: CGFloat = 16
    }
    
}

// thread 1 -> lendo
// lendo Constants.Sizes.horizontalAppSpacing

// thread 7 -> lendo
// lendo Constants.Sizes.horizontalAppSpacing

// thread 39 -> escrevendo
// Constants.Sizes.horizontalAppSpacing = 30

// thread 12 -> lendo
// lendo Constants.Sizes.horizontalAppSpacing
