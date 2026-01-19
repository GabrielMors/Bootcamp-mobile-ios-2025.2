//
//  AppDelegate.swift
//  InstagramClone
//
//  Created by Vagner Reis on 19/01/26.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(#function, "A")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print(#function, "B")
        return true
    }
}

class Test {
    func myFunc() {
        let minhaString = "teste"
        // Isso e codificado e nao criptografado
        let data = minhaString.data(using: .utf8)
        let base64 = data?.base64EncodedString()
        // Codificar
        // echo -n "hello world" | base64
        // decodificar
        // echo "aGVsbG8gd29ybGQ=" | base64 --decode
    }
}
