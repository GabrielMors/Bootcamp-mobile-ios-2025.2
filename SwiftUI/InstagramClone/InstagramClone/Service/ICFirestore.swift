//
//  ICFirestore.swift
//  InstagramClone
//
//  Created by Vagner Reis on 29/01/26.
//

import Foundation
import FirebaseDatabaseInternal
import FirebaseAuth

class ICFirestore {
    
    static let shared = ICFirestore()
    
    private var ref: DatabaseReference!
    
    private init() {
        ref = Database.database().reference()
    }
    
    func writeLog(logMessage message: String, ofType type: LogType) {
        
        if let currentUser = Auth.auth().currentUser {
            
            ref
                .child("logs")
                .child(currentUser.uid)
                .child(UUID().uuidString)
                .setValue([
                "message": message,
                "type": type.rawValue
            ])
            
        }
        
    }
    
    func favoriteToggle(isFavorite: Bool, model: ProfileModel) {
        
        if let _ = Auth.auth().currentUser {
            
            ref
                .child("stories")
                .child(model.id)
                .setValue([
                "isFavorite": isFavorite,
                "name": model.name,
                "city": model.city
            ])
            
        }
        
    }
    
}
extension ICFirestore {
    enum LogType: String {
        case fatal = "Erro fatal"
        case warning = "Warning"
        case debug = "Debug"
        case info = "Info"
    }
}
