//
//  UIViewController.swift
//  ValidadorCPF
//
//  Created by Vagner Reis on 03/12/25.
//

import Foundation

// nonisolated
// nonisolated(unsafe)
// @unchecked Sendable
// @preconcurrency


open class UIViewController {
    
    private let coder: NSCoder?
    private let size: CGSize?
    
    internal init(coder: NSCoder?) {
        self.coder = coder
        self.size = nil
    }
    
    public init(size: CGSize?) {
        self.size = size
        self.coder = nil
    }
    
    // Esse pode ter sobreescrita OPEN
    open func onAppear() {
        //
    }
    
    // Esse pode ter sobreescrita OPEN
    open func onWillAppear(_ animated: Bool) {
        //
    }
    
    // Esse nao pode
    public func metrics() -> CGSize? {
        return size
    }
    
}

