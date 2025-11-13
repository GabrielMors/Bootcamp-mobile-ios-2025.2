//
//  HomeViewController.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 20/10/25.
//

import UIKit
import FirebaseAuth

// HomeViewModel -> VM
// Model -> M
// View -> V


class HomeViewController: UIViewController {
    
    var user: UserModel?
    
    private var wrapper = WrapperModel<CarModel>()
    
    lazy var viewModel = HomeViewModel(wrapper: wrapper)
    
    private lazy var exitButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("Sair", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapExit), for: .touchUpInside)
        
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    @objc
    func didTapExit() {
        do {
            try Auth.auth().signOut()
            
            let controller = LoginViewController()
            
            navigationController?.addFadeAnimationAndNavigateToRoot(root: controller)
            
        } catch {
            print("Erro ao sair", error)
        }
    }

}
