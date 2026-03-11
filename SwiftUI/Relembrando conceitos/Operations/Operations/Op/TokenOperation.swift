//
//  TokenOperation.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation

class TokenOperation: Operation, @unchecked Sendable {
    
    var token: TokenModel?
    
    override func main() {
        let service = TokenService()
        token = service.getToken()
        print("token->>>>")
    }
    
}
