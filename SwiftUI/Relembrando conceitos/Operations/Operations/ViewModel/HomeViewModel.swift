//
//  HomeViewModel.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private let operations: RunOperations
    
    @Published var notes = [NoteModel]()
    
    @Published var isLoading = true
    
    init() {
        operations = RunOperations()
        operations.delegate = self
        operations.run()
    }
    
}

extension HomeViewModel: RunOperationsDelegate {
    @MainActor
    func getNotes(_ notes: [NoteModel]) {
        self.notes = notes
        print("Disparou trueee")
        self.isLoading = false
    }
}
