//
//  LoginViewController.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/10/25.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseAuthViewController {
    
    var screen: LoginScreen?
    
    private let socialNetwork = SocialNetwork()
    
    override func loadView() {
        super.loadView()
        screen = LoginScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socialNetwork.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Login"
        navigationItem.hidesBackButton = true
    }
    
}

extension LoginViewController: LoginScreenDelegate {
    
    func didTapCreateAccount() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    // Apple
    func didTapLogin() {
        socialNetwork.loginApple()
    }
    
    func didTapLogin(email: String, password: String) {
        socialNetwork.loginEmailAndPassword(email: email, password: password)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
}

extension LoginViewController: SocialNetworkAppleDelegate {
    
    func onLoginError(_ error: any Error) {
        print("Erro", error.localizedDescription)
        showAlert(title: "Erro", message: "Erro \(error.localizedDescription)")
    }
    
    func onLoginSuccess(user: FirebaseAuth.User?) {
        
        let homeViewController = HomeViewController()
        
        homeViewController.user = UserModel(with: user)
        
        navigationController?.setViewControllers([
            homeViewController
        ], animated: true)
        
        return
    }
    
}

