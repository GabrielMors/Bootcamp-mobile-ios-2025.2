//
//  RegisterScreen.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/10/25.
//

import Foundation
import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func didTapLogin(email: String, password: String)
    func showAlert(title: String, message: String)
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenDelegate?
    
    private lazy var logoImageView: UIImageView = {
        
        let iView = UIImageView()
        iView.image = UIImage(named: "logo")
        iView.translatesAutoresizingMaskIntoConstraints = false
        
        return iView
        
    }()
    
    private lazy var containerView: UIView = {
        
        let uView = UIView(frame: .zero)
        uView.translatesAutoresizingMaskIntoConstraints = false
        
        return uView
        
    }()
    
    private lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField(
            placeholder: "Digite seu e-mail",
            type: .email,
            keyboardType: .emailAddress
        )
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(
            placeholder: "Digite sua senha",
            type: .password,
            isSecurity: true
        )
        
        textField.delegate = self
        textField.tag = 1
        
        return textField
    }()
    
    private lazy var registerButton: CustomButton = {
        
        let button = CustomButton(title: "Criar conta")
        
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        build()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTapLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
            delegate?.showAlert(title: "Erro!", message: "E-mail e senha são obrigatórios")
            return
        }
        
        delegate?.didTapLogin(email: email, password: password)
    }
    
    private func build() {
        
        addSubview(logoImageView)
        
        addSubview(containerView)
        
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(registerButton)
       
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            // logo
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // Conainer
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Sizes.horizontalAppSpacing),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Sizes.horizontalAppSpacing),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // email
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // password
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 36),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // botao
            registerButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 36),
            registerButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
        
    }
    
}

extension RegisterScreen: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let customTextField = textField as? CustomTextField,
              let type = customTextField.type else {
            print("Impossivel fazer o cast")
            return
        }
        
        switch type {
        case .email:
            print("Email")
        case .password:
            print("password")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "")
        return true
        
    }
}
