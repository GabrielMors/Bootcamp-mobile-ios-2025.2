//
//  NoteOperation.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation

class NoteOperation: Operation, @unchecked Sendable {
    
    var notes: [NoteModel] = []
    
    override func main() {
        
        let defaults = UserDefaults.standard
        let accesstoken = defaults.object(forKey: "accesstoken") as? String
        
        guard let accesstoken else {
            print("nao foi possivel prosseguir pois nao tem o token")
            return
        }
        
        let tokenModel: TokenModel = .init(accesstoken: accesstoken)
        
        let service = NoteService()

        notes = service.getNotes(tokenModel: tokenModel) 
        print("notes->>>>")
    }
    
}
