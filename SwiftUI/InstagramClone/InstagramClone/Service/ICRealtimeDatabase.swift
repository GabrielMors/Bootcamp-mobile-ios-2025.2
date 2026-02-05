//
//  ICRealtimeDatabase.swift
//  InstagramClone
//
//  Created by Vagner Reis on 29/01/26.
//

import Foundation
import FirebaseDatabaseInternal
import FirebaseAuth

class ICRealtimeDatabase {
    
    static let shared = ICRealtimeDatabase()
    
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
    
    func getProfiles() async throws {
       // if let _ = Auth.auth().currentUser {
        let snapshot = try await ref.child("profile").getData()
        
        guard let value = snapshot.value else {
            return
        }
        
        let data = try JSONSerialization.data(withJSONObject: value)
        
        let decoder = JSONDecoder()
        let profiles = try decoder.decode([ProfileModelTest].self, from: data)
        
        print(profiles)
            
       // }
    }
    
}
extension ICRealtimeDatabase {
    enum LogType: String {
        case fatal = "Erro fatal"
        case warning = "Warning"
        case debug = "Debug"
        case info = "Info"
    }
}

//(
//{
//    banners =     (
//                {
//            image = "https://picsum.photos/id/1015/800/400";
//        },
//                {
//            image = "https://picsum.photos/id/1025/800/400";
//        },
//                {
//            image = "https://picsum.photos/id/1035/800/400";
//        }
//    );
//    city = "Japan, Tokio";
//    id = "1b3f7a8c-9a11-4d01-9f4b-123456789001";
//    name = "josei_l";
//    personImage = "https://picsum.photos/id/1011/300/300";
//},
//{
//    banners =     (
//                {
//            image = "https://picsum.photos/id/1050/800/400";
//        },
//                {
//            image = "https://picsum.photos/id/1060/800/400";
//        },
//                {
//            image = "https://picsum.photos/id/1070/800/400";
//        },
//                {
//            image = "https://picsum.photos/id/1080/800/400";
//        }
//    );
//    city = "Brazil, Sao Paulo";
//    id = "2c4a8b9d-8b22-4e02-8a5c-123456789002";
//    name = "anie_i";
//    personImage = "https://picsum.photos/id/1041/300/300";
//}
//)
//)
