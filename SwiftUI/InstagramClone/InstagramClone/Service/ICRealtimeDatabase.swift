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
        
        if let user = Auth.auth().currentUser {
            
            ref
                .child("favorites")
                .child(model.id)
                .child(user.uid)
                .setValue([
                "isFavorite": isFavorite,
                "email": user.email ?? "Unknown"
            ])
            
        }
        
    }
    
    func getFavoritesProfiles(
        ids: [String]
    ) async throws -> [(id: String, isFavorite: Bool)] {
        
        var profiles: [(id: String, isFavorite: Bool)] = []
        
        if let user = Auth.auth().currentUser {
            let snapshot = try await ref.child("favorites").getData()
            
            guard let value = snapshot.value as? [String: Any] else {
                throw ProfilesError.emptySnapshot
            }
            
            for id in ids {
                guard let profile = value[id] as? [String: Any] else {
                    continue
                }
                
                guard let findedUser = profile[user.uid] as? [String: Any] else {
                    continue
                }
                
                guard let isFavorite = findedUser["isFavorite"] as? Bool else {
                    continue
                }
                
                profiles.append(
                    (id, isFavorite)
                )
            }
            
        }
        
        return profiles
    }
    
    func getProfiles() async throws -> [ProfileModel] {
       // if let _ = Auth.auth().currentUser {
        let snapshot = try await ref.child("profile").getData()
        
        guard let value = snapshot.value else {
            throw ProfilesError.emptySnapshot
        }
        
        let data = try JSONSerialization.data(withJSONObject: value)
        
        let decoder = JSONDecoder()
        let profiles = try decoder.decode([ProfileModel].self, from: data)
        
        return profiles
            
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

extension ICRealtimeDatabase {
    enum ProfilesError: Error {
        case emptySnapshot
    }
}

// {
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
// }
