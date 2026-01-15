//
//  MyUserDetauls.swift
//  InstagramClone
//
//  Created by Vagner Reis on 14/01/26.
//

import Foundation


struct MyUserDetauls {
    
    private let userDefaults: UserDefaults
    
    var IsAuth: Bool {
        userDefaults.bool(forKey: "isAuth")
    }
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func setIsAuth(_ auth: Bool) {
        userDefaults.set(auth, forKey: "isAuth")
    }
    
}
