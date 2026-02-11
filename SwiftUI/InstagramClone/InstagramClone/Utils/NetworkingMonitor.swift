//
//  NetworkingMonitor.swift
//  InstagramClone
//
//  Created by Vagner Reis on 11/02/26.
//

import Foundation
import Network

class NetworkingMonitor {
    
    private let monitor: NWPathMonitor
    
    @discardableResult
    init(completion: @escaping (Bool) -> Void) {
        self.monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Com conexão")
                completion(true)
            } 
        }

        monitor.start(queue: DispatchQueue.global())
    }
    
}
