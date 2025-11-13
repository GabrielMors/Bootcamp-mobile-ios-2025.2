//
//  CounterController.swift
//  ViewModel
//
//  Created by Vagner Reis on 12/11/25.
//

import UIKit

// M. V. VM.

// V -> View
class CounterController: UIViewController {
    
     var screen: CounterScreen?
    
    // Composicao
    private var viewModel = CounterViewModel()
    
    override func loadView() {
        screen = CounterScreen()
        screen?.delegate = self
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        viewModel.onCountChange = { [weak self] newValue in
            
            guard let self = self else {
                print("VGN: CounterController - onCountChange - self is nil")
                return
            }
            
            self.screen?.label.text = "\(newValue)"
            
            
        }
    }

}

extension CounterController: CounterScreenDelegate {
    
    func onTapIncrement() {
        viewModel.increment()
    }
    
    func onTapDecrease() {
        viewModel.decrease()
    }
    
}

