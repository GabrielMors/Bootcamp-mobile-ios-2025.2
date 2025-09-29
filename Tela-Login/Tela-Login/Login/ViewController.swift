//
//  ViewController.swift
//  Tela-Login
//
//  Created by Gabriel Mors Pulga on 10/09/25.
//

import UIKit

class ViewController: UIViewController {

//    Ligações @IBOutlet SEMPRE são feitas acima dos metodos de ciclo de vida
    
//    Ligações @IBOutlet São feitas para que possa ser utilizado/configurado as propriedades (caracterisicas) dos elementos
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configElements()
        createdElements()
        isEnabledLoginButton(isEnable: true)
    }
    
//    Ligações @IBAction representam AÇÃO DOS ELEMENTOS
//    OBS: As ligações IBAction sempre ficam em baixo dos métodos de ciclo de vida
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        view.backgroundColor = .blue
        loginLabel.text = "Davi"
    }
    
    func createdElements() {
        configTextField(textField: emailTextField, placeholder: "Digite seu email:", keyboard: .emailAddress)
        configTextField(textField: passwordTextField, placeholder: "Digite sua senha:", keyboard: .numberPad)
    }
    
    func configTextField(textField: UITextField, placeholder: String, keyboard: UIKeyboardType) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboard
    }
    
    func configElements() {
        loginLabel.text = "Gabriel"
        loginLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        loginButton.setTitle( "Entrar", for: .normal)
    }
    
    func isEnabledLoginButton(isEnable: Bool) {
        loginButton.isEnabled = isEnable//          True          false
        loginButton.backgroundColor = isEnable ? .systemBlue : .lightGray
    }
    
}

