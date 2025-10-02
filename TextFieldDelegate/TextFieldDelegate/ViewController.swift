//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Gabriel Mors Pulga on 02/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields(textField: emailTextField, placeholder: "Digite seu email:", keyboard: .emailAddress, isSecure: false)
        configTextFields(textField: passwordTextField, placeholder: "Digite sua senha:", keyboard: .default, isSecure: true)
        configButton()
    }

    
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        
    }
    
    private func configButton() {
        enterButton.isEnabled = false
    }
    
    private func configTextFields(textField: UITextField, placeholder: String, keyboard: UIKeyboardType, isSecure: Bool) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboard
        textField.isSecureTextEntry = isSecure
        textField.autocorrectionType = .no
        
//        Assinando o protocolo
        textField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}


extension ViewController: UITextFieldDelegate {
    
//    Esse método é disparado quando o teclado sobe
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderWidth = 2.0
        
//        if textField == emailTextField {
//            textField.layer.borderColor = UIColor.blue.cgColor
//        } else {
//            textField.layer.borderColor = UIColor.purple.cgColor
//        }
        
//        Exemplo com Switch casa
        switch textField {
        case emailTextField:
            textField.layer.borderColor = UIColor.blue.cgColor
        case passwordTextField:
            textField.layer.borderColor = UIColor.purple.cgColor
        default:
            print("Não é nenhum deles!!!!")
        }
    }
    
//    esse método é disparado quando o teclado abaixa/some
//    O DidEnd SEMPRE é utilizado para realizar validações!!!!!!!!!!!!!!!!!!!
//    Não recomendo criar validações no textFieldShouldReturn
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        
        if emailTextField.hasText && passwordTextField.hasText {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
        
        print(#function)
    }
    
//    Esse método é disparado quando o usuário clica no botão return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
    
//    Esse método é disparado assim que é feito qualquer alteração de text no textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
            let newText = text.replacingCharacters(in: range, with: string)
            print(newText)
        }
        return true
    }
}
