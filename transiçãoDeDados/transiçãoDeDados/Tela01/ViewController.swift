//
//  ViewController.swift
//  transiçãoDeDados
//
//  Created by Gabriel Mors Pulga on 01/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }

    private func configElements() {
        nameTextField.placeholder = "Digite seu nome"
    }
    
    //    O operador as? tenta fazer um cast (conversão) seguro do tipo da variável. No seu caso, ele tenta converter o resultado para o tipo Tela02ViewController. Se não for possível, retorna nil ao invés de causar erro. Ou seja, você está dizendo que espera que o objeto seja do tipo Tela02ViewController, mas pode não ser.
    
    @IBAction func tappedDataButton(_ sender: UIButton) {
//        let controller = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController
//NÃO PODEMOS ACESSAR UM COMPONENTE ANTES DAR VIDA A ELE!!!!!!!
//        controller?.nameLabel.text = "Gabriel Mors"
//        controller?.name = nameTextField.text ?? ""
        
        let controller = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: Tela02ViewController.self)) { coder -> Tela02ViewController? in
            return Tela02ViewController(coder: coder, name: self.nameTextField.text ?? "")
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
//MARK: CODER é uma referencia da instancia
//    é uma ferramenta que o sistema usa para cirar uma classe a paretir do arquivo storybaord
}

