//
//  ViewController.swift
//  MyCoreData
//
//  Created by Vagner Reis on 03/11/25.
//

import UIKit
import CoreData

// Buscas
// Predicate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addUser(username: "Vagner", age: 33)
//        addUser(username: "Pedro", age: 31)
//        addUser(username: "Ana", age: 19)
        
        let users = gelAllUsers()
        
        users.forEach { user in
            print("--- Start ---")
            print("name:", user.username)
            print("age:", user.age)
            print("--- End ---")
        }
    }

    func addUser(username: String, age: Int32) {
        let context = CoreDataStack.shared.context
        let userEntity = UserEntity(context: context)
        userEntity.username = username
        userEntity.age = age
        
        CoreDataStack.shared.saveContext()
        
    }
    
    func gelAllUsers() -> [UserEntity] {
        
        let request = UserEntity.fetchRequest()
        
        do {
            return try CoreDataStack.shared.context.fetch(request)
        } catch {
            print("Erro ao pegar os dados \(error)")
            return []
        }
        
    }

}
