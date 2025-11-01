//
//  UINavigationController+FadeAnimation.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 27/10/25.
//

import Foundation
import UIKit

extension UINavigationController {
    func addFadeAnimationAndNavigateToRoot(root controller: UIViewController) {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.33
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
  
        view.layer.add(transition, forKey: kCATransition)
        setViewControllers([controller], animated: false)
    }
}

