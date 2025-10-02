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
    
    //    NSCoder é uma classe do framework Foundation usada para codificar e decodificar dados, geralmente para persistência ou transferência de objetos. No contexto do UIKit, ele é utilizado principalmente para inicializar objetos de interface gráfica criados via Storyboard ou XIB, pois esses arquivos armazenam o estado dos objetos de forma serializada.
        
    //    Devemos usar o NSCoder nos inicializadores (init(coder:)) de view controllers e views quando queremos garantir que eles possam ser corretamente instanciados pelo sistema ao carregar interfaces gráficas do Storyboard/XIB. Isso é obrigatório para que o UIKit consiga reconstruir os objetos e suas propriedades conforme definido visualmente.
    
    init?(coder: NSCoder, name: String) {
        self.name = name
        super.init(coder: coder)
    }
    //    O required init?(coder: NSCoder) é um inicializador obrigatório em subclasses de UIViewController (e outras classes que suportam codificação), usado pelo UIKit para criar instâncias a partir de Storyboards ou XIBs. O modificador required indica que todas as subclasses devem implementar esse inicializador, garantindo que o sistema consiga reconstruir o objeto corretamente durante a desserialização.
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

