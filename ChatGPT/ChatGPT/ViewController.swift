//
//  ViewController.swift
//  ChatGPT
//
//  Created by Vagner Reis on 05/11/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tap(_ sender: Any) {
        
        let service = GPTService.shared
        
        let request = GPTRequestModel(input: "Quanto é 2 + 2")
        
        // "Fluxo normal", main
        print("A")
        
        Task {
            do {
                let response = try await service.requestText(with: request)
                // fora da main
                print("B")
                
                DispatchQueue.main.async {
                    self.view.backgroundColor = .red
                }
                
                print("VGN Success: ", response)
            } catch {
                // fora da main
                print("B")
                print("VGN errror:", error)
            }
        }
        
        // "Fluxo normal", main
        print("C")
    }
    

}

