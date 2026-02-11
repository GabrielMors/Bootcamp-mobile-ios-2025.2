//
//  AuthServiceProtocol.swift
//  InstagramClone
//
//  Created by Vagner Reis on 09/02/26.
//

import Foundation

protocol AuthServiceProtocol {
    func getCurrentUser(complition: @escaping (Result<Model?, AuthService.AppError>) -> Void)
}
