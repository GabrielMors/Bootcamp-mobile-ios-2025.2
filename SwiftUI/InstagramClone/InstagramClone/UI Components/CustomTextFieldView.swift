//
//  CustomTextFieldView.swift
//  InstagramClone
//
//  Created by Vagner Reis on 28/01/26.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    private var placeholder: String
    private var textContentType: TextContentType?
    
    @Binding private var text: String
    
    init(
        placeholder: String,
        text: Binding<String>,
        textContentType: TextContentType? = nil
    ) {
            self.placeholder = placeholder
            self.textContentType = textContentType
            self._text = text
        }
    
    var body: some View {
        
        switch textContentType {
        case .security:
            SecureField(placeholder, text: $text)
                .textFieldStyle()
        case nil:
            TextField(placeholder, text: $text)
                .textFieldStyle()
        }
    }
}

#Preview {
    CustomTextFieldView(
        placeholder: "Digite no campo",
        text: .constant(""),
        textContentType: nil
    )
    .padding()
}

extension CustomTextFieldView {
    enum TextContentType {
        //case normal
        case security
    }
}

fileprivate struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: ICConstants.Metrics.inputHeight)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: ICConstants.Metrics.cornerRadius))
            .overlay(content: {
                RoundedRectangle(cornerRadius: ICConstants.Metrics.cornerRadius)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            })
    }
    
}

fileprivate extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldModifier())
    }
}
