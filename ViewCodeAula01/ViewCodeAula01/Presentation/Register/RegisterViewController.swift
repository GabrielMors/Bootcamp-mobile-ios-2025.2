//
//  LoginViewController.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 13/10/25.
//

import UIKit
import FirebaseAuth

class RegisterViewController: BaseAuthViewController {

    var screen: RegisterScreen?

    override func loadView() {
        super.loadView()
        screen = RegisterScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isUserInteractionEnabled = true
        view.layoutIfNeeded()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Criar conta"
    }
    
    func navDestination(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }

}

extension RegisterViewController: RegisterScreenDelegate {
    
    func didTapLogin(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let authResult {
                
                let homeViewController = HomeViewController()
                
                homeViewController.user = UserModel(with: authResult.user)
                
                self.navDestination(homeViewController)
                
                return
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
}

