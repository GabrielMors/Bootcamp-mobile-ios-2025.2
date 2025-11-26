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
    
    var viewModel = HomeViewModel(cars: [
        CarModel(year: 1998, name: "Chevete", imageURL: ""),
        CarModel(year: 1993, name: "Opala", imageURL: "")
    ])
    
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setTableViewDelegates(self, self)
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let model = viewModel.cellModel(at: indexPath.row)
        cell.configure(model)
        
        return cell
        
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
