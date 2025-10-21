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

    override func loadView() {
        super.loadView()
        screen = LoginScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Login"
    }
    
    func navDestination(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }

}

extension LoginViewController: LoginScreenDelegate {
    
    func didTapCreateAccount() {
        navDestination(RegisterViewController())
    }
    
    // Apple
    func didTapLogin() {
        let socialNetworkApple = SocialNetworkApple()
        socialNetworkApple.login()
    }
    
    func didTapLogin(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          
            guard error == nil else {
                strongSelf.showAlert(title: "Erro", message: "Os dados não conferem")
                return
            }
            
            if let authResult {
                
                let homeViewController = HomeViewController()
                
                homeViewController.user = UserModel(with: authResult.user)
                
                strongSelf.navDestination(homeViewController)
                
                return
            }
            
            strongSelf.showAlert(title: "Erro", message: "Erro desconhecido")
            
        }
        
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
}

