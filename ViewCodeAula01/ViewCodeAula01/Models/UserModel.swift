//
//  UserModel.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 20/10/25.
//

import Foundation
import FirebaseAuth

struct UserModel: CustomModel {
    let email: String
    
    init(with firebaseUser: User?) {
        email = firebaseUser?.email ?? ""
    }
}
