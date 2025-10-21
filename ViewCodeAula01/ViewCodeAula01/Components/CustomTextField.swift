//
//  CustomTextField.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 16/10/25.
//

import UIKit

enum TextFieldType {
    case email
    case password
}

class CustomTextField: UITextField {
    
    private let spacing = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    private(set) var type: TextFieldType?
    
    init(
        placeholder: String,
        type: TextFieldType,
        keyboardType: UIKeyboardType = .default,
        isSecurity: Bool = false
    ) {
        super.init(frame: .zero)
        isSecureTextEntry = isSecurity
        self.keyboardType = keyboardType
        self.type = type
        self.placeholder = placeholder
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .secondarySystemBackground
        textColor = .label
        font = UIFont.systemFont(ofSize: 17, weight: .medium)
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.separator.cgColor
        
        autocorrectionType = .no
        autocapitalizationType = .none
        clearButtonMode = .whileEditing
        
        // Sombra leve
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.05
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: spacing)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: spacing)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: spacing)
    }
    
}
