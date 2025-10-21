//
//  CustomButton.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 20/10/25.
//

import UIKit

enum LoginType {
    case emailWithPassword
    case apple
}

class CustomButton: UIButton {
    
    private var title: String
    private var loginType: LoginType

    init(title: String, loginType: LoginType = .emailWithPassword) {
        self.title = title
        self.loginType = loginType
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        
        switch loginType {
        case .emailWithPassword:
            backgroundColor = UIColor.systemBlue
        case .apple:
            backgroundColor = UIColor.black
        }
        
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 14
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
}
