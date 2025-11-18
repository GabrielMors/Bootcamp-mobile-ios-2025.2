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
    
    var viewModel = HomeViewModel()
    
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        screen?.delegate = self
        screen?.carModels = viewModel.models
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
}

extension HomeViewController: HomeScreenDelegate {
    
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

