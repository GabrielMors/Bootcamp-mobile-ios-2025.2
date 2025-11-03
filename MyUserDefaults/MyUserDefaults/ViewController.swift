//
//  ViewController.swift
//  MyUserDefaults
//
//  Created by Vagner Reis on 03/11/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Dados local")
//        Storage.shared.add(.userName, value: "Vagner Oliveira")
//        Storage.shared.add(.isLogged, value: true)
        
        let isLogged = Storage.shared.get(.isLogged, type: Bool.self)
        
        let username = Storage.shared.get(.userName, type: String.self)
        
        let token = Storage.shared.get(.token, type: String.self)

        print("isLogged", isLogged)
    }


}

