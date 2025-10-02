//
//  Tela02ViewController.swift
//  transiçãoDeDados
//
//  Created by Gabriel Mors Pulga on 01/10/25.
//

import UIKit
import Foundation

class Tela02ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
//    var name: String = ""
    let name: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    
    init?(coder: NSCoder, name: String) {
        self.name = name
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

