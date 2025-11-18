//
//  LoginScreen.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/10/25.
//

import Foundation
import UIKit

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenDelegate?
    
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
    
    private lazy var loginWithEmailPasswordButton: CustomButton = {
        
        let button = CustomButton(title: "Entrar")
        
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var loginWithAppleButton: CustomButton = {
        
        let button = CustomButton(title: "Entrar com a Apple", loginType: .apple)
        
        button.addTarget(self, action: #selector(didTapLoginWithApple), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var createAccountButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        button.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTapCreateAccount() {
        delegate?.didTapCreateAccount()
    }
    
    @objc
    private func didTapLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
            delegate?.showAlert(title: "Erro!", message: "E-mail e senha são obrigatórios")
            return
        }
        
        delegate?.didTapLogin(email: email, password: password)
    }
    
    @objc
    private func didTapLoginWithApple() {
        delegate?.didTapLogin()
    }
    
    private func addSubviews() {
        
        addSubview(logoImageView)
        
        addSubview(containerView)
        
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(loginWithEmailPasswordButton)
        containerView.addSubview(loginWithAppleButton)
        
        addSubview(createAccountButton)
        
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Conainer
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Sizes.horizontalAppSpacing),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Sizes.horizontalAppSpacing),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // logo
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // email
            emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // password
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 36),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // botao
            loginWithEmailPasswordButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            loginWithEmailPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 36),
            loginWithEmailPasswordButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            loginWithAppleButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            loginWithAppleButton.topAnchor.constraint(equalTo: loginWithEmailPasswordButton.bottomAnchor, constant: 24),
            loginWithAppleButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            loginWithAppleButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            // Ciar
            createAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 32)
            
        ])
        
    }
    
}

extension LoginScreen: UITextFieldDelegate {
    
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

protocol LoginScreenDelegate: AnyObject {
    func didTapLogin(email: String, password: String)
    func didTapLogin()
    func showAlert(title: String, message: String)
    func didTapCreateAccount()
}
