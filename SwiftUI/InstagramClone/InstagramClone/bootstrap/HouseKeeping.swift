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
            }
        }
    }
    
    private func checkSyncs() {
        checkIsFavoriteToSync()
    }
    
    private func checkIsFavoriteToSync() {
        let defaults = UserDefaults.standard
       
        guard let favoritesDatas = defaults.value(forKey: ICConstants.Keys.pendingOperation) as? [Data] else {
            return
        }
        
        let decoder = JSONDecoder()
       
        for favoritesData in favoritesDatas {
            guard let pendingOperation = try? decoder.decode(PendingOperation<SyncFavoriteModel>.self, from: favoritesData) else {
                continue
            }
            
            DatabaseService.Favorite.shared.favoriteToggle(
                isFavorite: pendingOperation.model.isFavorite,
                model: pendingOperation.model.profileModel
            )
        }
        
        defaults.removeObject(forKey: ICConstants.Keys.pendingOperation)
        
    }
    
}
