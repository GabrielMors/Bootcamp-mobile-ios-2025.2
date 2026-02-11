//
//  HouseKeeping.swift
//  InstagramClone
//
//  Created by Vagner Reis on 11/02/26.
//

import Foundation

class HouseKeeping {
    
    func startMonitor() {
        NetworkingMonitor { isSuccess in
            if isSuccess {
                self.checkSyncs()
                //DatabaseService.Favorite.shared.favoriteToggle(isFavorite: <#T##Bool#>, model: <#T##ProfileModel#>)
            }
        }
    }
    
    private func checkSyncs() {
        checkIsFavoriteToSync()
    }
    
    private func checkIsFavoriteToSync() {
        let defaults = UserDefaults.standard
        
        let favoritesData = defaults.value(forKey: PendingOperationType.favorites.rawValue) as? Data
       
        guard let favoritesData else {
            return
        }
        
        do {
            
            let decoder = JSONDecoder()
            let pendingOperation = try decoder.decode(PendingOperation<SyncFavoriteModel>.self, from: favoritesData)
            
            DatabaseService.Favorite.shared.favoriteToggle(
                isFavorite: pendingOperation.model.isFavorite,
                model: pendingOperation.model.profileModel
            )
            
        } catch {
            print("ERRORRR", error)
        }
        
        
    }
    
}
