//
//  TaskModel.swift
//  TesteUnitario1
//
//  Created by Vagner Reis on 11/03/26.
//

import Foundation

struct TaskModel {
    let id: UUID = UUID()
    let title: String
    var isCompleted: Bool = false
}
