//
//  DatabaseService.swift
//  InstagramClone
//
//  Created by Vagner Reis on 29/01/26.
//

import Foundation
import FirebaseDatabaseInternal
import FirebaseAuth

class DatabaseService { }

extension DatabaseService {
    class Logs {
        
        static let shared = Logs()
        
        private let ref = Database.database().reference()
        
        private init() { }
        
        func writeLog(
            logMessage message: String,
            ofType type: LogType
        ) {
            
            if let currentUser = Auth.auth().currentUser {
                
                ref
                    .child("logs")
                    .child(currentUser.uid)
                    .child(UUID().uuidString)
                    .setValue([
                        "message": message,
                        "type": type.rawValue,
                        "timestamps": Date.now.timeIntervalSince1970
                    ])
                
            }
            
        }
    }
}

extension DatabaseService {
    class Favorite {
        
        static let shared = Favorite()
        
        private let ref = Database.database().reference()
        
        private init() { }
        
        func favoriteToggle(
            isFavorite: Bool,
            model: ProfileModel
        ) {
            
            if let user = Auth.auth().currentUser {
                
                let id = model.id
                let uid = user.uid
                let email = user.email ?? "Unknown"
                let favoritesKey = PendingOperationType.favorites
                
                Task {
                    do {
                      
                        try await ref
                            .child(favoritesKey.rawValue)
                            .child(id)
                            .child(uid)
                            .setValue([
                                "isFavorite": isFavorite,
                                "email": email
                            ])
                        
                        
                    } catch {
                        // nesse ponto, primeiro verifico se o erro é do tipo sem conex
                        
                        if let _ = error as? ConnectionErrorTest {
                            print("nao foi possivel favoritar em BG, vai ser enviado assim q a internet voltar")
                            
                            let defaults = UserDefaults.standard
                            
                            let favoriteModel = SyncFavoriteModel(isFavorite: isFavorite, profileModel: model)
                            
                            let pendingOperation = PendingOperation(type: favoritesKey, model: favoriteModel)
                            
                            let encode = JSONEncoder()
                            guard let data = try? encode.encode(pendingOperation) else {
                                print("Deu B.O precisa ver como resolver")
                                return
                            }
                            
                            print("Dados salvos para sync posterior", model, isFavorite)
                            defaults.set(data, forKey: favoritesKey.rawValue)
                            
                            return
                        }
                        
//                        let nsError = error as NSError
//                        
//                        // analogia sem conex
//                        if nsError.code == AuthErrorCode.networkError.rawValue {
//                            return
//                        }
                        
                        // tratar outros tipos de erro
                    }
                }
 
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
        
    }
}

extension DatabaseService {
    
    class Profile {
        
        static let shared = Profile()
        
        private let ref = Database.database().reference()
        
        private init() { }
        
        func getProfiles() async throws -> [ProfileModel] {
            
            guard let _ = Auth.auth().currentUser else {
                return []
            }
            
            let snapshot = try await ref.child("profile").getData()
            
            guard let value = snapshot.value else {
                throw ProfilesError.emptySnapshot
            }
            
            let data = try JSONSerialization.data(withJSONObject: value)
            
            let decoder = JSONDecoder()
            let profiles = try decoder.decode([ProfileModel].self, from: data)
            
            return profiles
        }
    }
}

extension DatabaseService {
    enum LogType: String {
        case fatal = "Erro fatal"
        case warning = "Warning"
        case debug = "Debug"
        case info = "Info"
    }
}

extension DatabaseService {
    enum ProfilesError: Error {
        case emptySnapshot
    }
}

fileprivate enum ConnectionErrorTest: Error {
    case noInternet
}
