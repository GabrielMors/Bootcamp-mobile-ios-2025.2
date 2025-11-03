//
//  Storage.swift
//  MyUserDefaults
//
//  Created by Vagner Reis on 03/11/25.
//

// UserDefaults limitado a alguns tiposs de dados
// Bool
// String
// Int, Double, etc
// Array, Dictionary
// Data

// UserDefaults
// nao armazenar dados sensiveis
// Dados mais simples, ex valores "Primitivos"

// Core Data
// Nao armazenar dados sensiveis
// Dados mais complexos, ex class/struct, dados encadeados

// -----------

// Keychain -> chaveiro
// Dados mais sensiveis, ex: senha, certificados


// Offline First
// Interface otimista


import Foundation

final class Storage {
    
    static let shared = Storage()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func get<T>(_ key: Keys, type: T.Type) -> T? {
        return defaults.object(forKey: key.rawValue) as? T
    }
    
    func add(_ key: Keys, value: Any?) -> Void {
        defaults.setValue(value, forKey: key.rawValue)
    }
    
    func delete(_ key: Keys) -> Void {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    func deleteAll() {
        Keys.allCases.forEach {
            defaults.removeObject(forKey: $0.rawValue)
        }
    }
    
}

extension Storage {
    enum Keys: String, CaseIterable {
        case userName = "userName"
        case isLogged = "isLogged"
        case token = "token"
    }
}
