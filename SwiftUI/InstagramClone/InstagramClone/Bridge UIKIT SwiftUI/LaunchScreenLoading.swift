//
//  LaunchScreenLoading.swift
//  InstagramClone
//
//  Created by Vagner Reis on 26/01/26.
//

import Foundation
import UIKit
import SwiftUI

struct LaunchScreenLoading: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Launch Screen", bundle: nil)
        return storyboard.instantiateInitialViewController() ?? UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
         
    }
    
}
