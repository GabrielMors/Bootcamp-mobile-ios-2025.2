//
//  MainViewController.swift
//  AplicativoPrincipal
//
//  Created by Vagner Reis on 03/12/25.
//

import Foundation
import ValidadorCPF

//

nonisolated
final class MainViewController: UIViewController {
    
    override init(size: CGSize?) {
        super.init(size: size)
    }
    
    override func onAppear() {
        super.onAppear()
        let size = super.metrics()
    }
    
    override func onWillAppear(_ animated: Bool) {
        super.onWillAppear(animated)
    }

    // nao aceita sobrees crita pois é publico e nao open!
//    override func metrics() -> CGSize? {
//
//    }
    
}
