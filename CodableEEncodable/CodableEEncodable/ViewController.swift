//
//  ViewController.swift
//  CodableEEncodable
//
//  Created by Vagner Reis on 30/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = Service<User>()
        let user = User(name: "Vagner Reis", dateOfBirth: "10/10/2000", address: Address(street: "Rua do Carmo", number: 10))
        
//        service.insert(user: user) { result in
//             
//            switch result {
//            case .success(let success):
//                print("SUCCESS", success)
//            case .failure(let failure):
//                print("ERRO: ", failure)
//            }
//            
//        }
        
        service.getAll { result in
            switch result {
            case .success(let users):
                print("Users", users)
            case .failure(let failure):
                print("Error", failure)
            }
        }
        
        
    }


}

