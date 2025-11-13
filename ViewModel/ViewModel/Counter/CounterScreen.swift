//
//  CounterScreen.swift
//  ViewModel
//
//  Created by Vagner Reis on 12/11/25.
//

import Foundation
import UIKit

class CounterScreen: UIView {
    
    weak var delegate: CounterScreenDelegate?
    
    lazy var label: UILabel = {

        let label = UILabel()
        
        label.text = "0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private lazy var incrementButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Incrementar", for: .normal)
        
        button.addTarget(self, action: #selector(onTapIncrement), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var decreaseButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Decrementar", for: .normal)
        
        button.addTarget(self, action: #selector(onTapDecrease), for: .touchUpInside)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// Private methods
extension CounterScreen {
    
    @objc
    private func onTapIncrement() {
        delegate?.onTapIncrement()
    }
    
    @objc
    private func onTapDecrease() {
        delegate?.onTapDecrease()
    }
    
    private func addSubviews() {
        addSubview(label)
        addSubview(incrementButton)
        addSubview(decreaseButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            incrementButton.topAnchor.constraint(equalTo: label.bottomAnchor),
            incrementButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            decreaseButton.topAnchor.constraint(equalTo: incrementButton.bottomAnchor),
            decreaseButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}

protocol CounterScreenDelegate: AnyObject {
    func onTapIncrement()
    func onTapDecrease()
}
