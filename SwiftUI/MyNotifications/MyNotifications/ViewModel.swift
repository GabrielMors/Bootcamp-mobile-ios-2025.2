//
//  ViewModel.swift
//  MyNotifications
//
//  Created by Vagner Reis on 18/02/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var messages = [MyMessage]()
    
    @Published var inLive = false
    
    @Published var firebaseMSG = ""
    
    var observador = PassthroughSubject<String, Error>()
    
    init() {
        NotificationCenter.default
            .publisher(for: .send)
            .receive(on: RunLoop.main)
            .compactMap { $0.object as? [MyMessage] }
            .assign(to: \.messages, on: self)
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: .inLive)
            .receive(on: RunLoop.main)
            .compactMap { $0.userInfo?["inLive"] as? Bool }
            .assign(to: \.inLive, on: self)
            .store(in: &cancellables)
        
//        NotificationCenter.default
//            .publisher(for: .firebaseMSG)
//            .receive(on: RunLoop.main)
//            .compactMap { $0.userInfo?["firebaseMSG"] as? String }
//            .assign(to: \.firebaseMSG, on: self)
//            .store(in: &cancellables)
        
        // nao usar para atualizar a UI
        observador.sink(receiveCompletion: { result in
            switch result {
            case .finished:
                print("Valor recebido OKKKK")
            case .failure(let failure):
                print("Valor failure", failure)
                break
            }
        }, receiveValue: { value in
            print("Valor recebido", value)
        })
         .store(in: &cancellables)
        
        
    }
}
