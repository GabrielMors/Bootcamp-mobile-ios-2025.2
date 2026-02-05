//
//  View+onChangeAuth.swift
//  InstagramClone
//
//  Created by Vagner Reis on 04/02/26.
//

import Foundation
import SwiftUI

fileprivate struct OnChangeModifier: ViewModifier {
    
    @Binding private var values: [String]
    private let closure: () -> Void
    
    init(values: Binding<[String]>, closure: @escaping () -> Void) {
        self._values = values
        self.closure = closure
    }
    
    func body(content: Content) -> some View {
        
        if #available(iOS 17.0, *) {
            content
                .onChange(of: values) { _, _ in
                    closure()
                }
        } else {
            content
                .onChange(of: values) { _ in
                    closure()
                }
        }
        
    }
    
}

extension View {
    func onChangeAuth(
        of values: Binding<String>...,
        closure: @escaping () -> Void
    ) -> some View {
        
        let binding = Binding<[String]>(
            get: {
                values.map { $0.wrappedValue }
            },
            set: { newValues in
                for (index, value) in newValues.enumerated() {
                    if index < values.count {
                        values[index].wrappedValue = value
                    }
                }
            }
        )
        
        return modifier(OnChangeModifier(values: binding, closure: closure))
    }
}

