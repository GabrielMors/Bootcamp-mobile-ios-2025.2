//
//  PosLaunchScreenViewController.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 27/10/25.
//

import UIKit
import FirebaseAuth

class PosLaunchScreenViewController: UIViewController {
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loading: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: .default)
        pv.progressTintColor = .systemBlue
        pv.trackTintColor = .systemGray
        pv.progress = 0
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            
            loading.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loading.heightAnchor.constraint(equalToConstant: 4),
            loading.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
        
        UIView.animate(withDuration: 3) {
            self.loading.setProgress(1, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            let isAuth = Auth.auth().currentUser != nil
            
            if isAuth {
                
                let user = Auth.auth().currentUser
                let homeViewController = HomeViewController()
               
                let userModel = UserModel(with: user)
                
                homeViewController
                    .viewModel
                    .setUser(userModel)
                
                self.navigationController?.addFadeAnimationAndNavigateToRoot(root: homeViewController)
                
            } else {
                self.navigationController?.addFadeAnimationAndNavigateToRoot(root: LoginViewController())
            }
        })
        
    }
    
}
