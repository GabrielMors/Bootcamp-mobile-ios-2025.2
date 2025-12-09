//
//  LinearGradient.swift
//  InstagramClone
//
//  Created by Vagner Reis on 08/12/25.
//

import SwiftUI

extension LinearGradient {
    
    static var customLinearGradient = LinearGradient(colors: [
        .red, .purple
    ], startPoint: .leading, endPoint: .bottomTrailing)
    
    static var liveLinearGradient = LinearGradient(colors: [
        .red1, .red2, .red3
    ], startPoint: .topLeading, endPoint: .bottomTrailing)
    
}
