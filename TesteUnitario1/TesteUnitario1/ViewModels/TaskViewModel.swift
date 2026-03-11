//
//  TaskViewModel.swift
//  TesteUnitario1
//
//  Created by Vagner Reis on 11/03/26.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    
    @Published private(set) var tasks = [TaskModel]()
    
    func addTask(_ title: String) {
        guard !title.isEmpty else { return }
        tasks.append(TaskModel(title: title))
    }
    
    func toogleTask(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }
        tasks[index].isCompleted.toggle()
    }
    
    func removeTask(id: UUID) {
        tasks.removeAll(where: { $0.id == id })
    }
    
}
