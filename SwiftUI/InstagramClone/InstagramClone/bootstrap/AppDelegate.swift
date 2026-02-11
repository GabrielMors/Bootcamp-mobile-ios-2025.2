//
//  AppDelegate.swift
//  InstagramClone
//
//  Created by Vagner Reis on 19/01/26.
//

import Foundation
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print(#function, "B")
        
        FirebaseApp.configure()
        
        let houseKeeping = HouseKeeping()
        
        houseKeeping
            .startMonitor()
        
        return true
    }
}
