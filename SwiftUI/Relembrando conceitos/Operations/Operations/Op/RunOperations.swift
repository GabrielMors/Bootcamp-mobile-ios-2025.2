//
//  RunOperations.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation

// Thread -> exec real na CPU
// DispatchQueue -> Fila de tarefas
// Operation -> objeto que representa uma tarefa
// OperationQueue -> Fila que executa a operation

// user
// profile
// api url
// password

class RunOperations: OperationQueue, @unchecked Sendable {
    
   var delegate: RunOperationsDelegate?
    
    func run() {
        
//        var url = ""
//        var profile = ""
//        var api = ""
//        var user = ""
//        
//        var concorrency = ""
//        
//        let userOperation = BlockOperation {
//            print("userOperation")
//            user = "--vagner"
//        }
//        
//        let profileOperation = BlockOperation {
//            profile = "@zminny" + user
//        }
//        
//        let urlOperation = BlockOperation {
//            url = "www.google.com" + user
//        }
//        
//        let apiOperation = BlockOperation {
//            api = "text.com/api/v1" + user
//        }
//        
//        let queue = OperationQueue()
//        
//        queue.maxConcurrentOperationCount = 2
//        
//        profileOperation.addDependency(userOperation)
//        urlOperation.addDependency(userOperation)
//        apiOperation.addDependency(userOperation)
//        
//        queue.addOperations([
//            userOperation,
//            profileOperation,
//            urlOperation,
//            apiOperation
//        ], waitUntilFinished: true)
//        
//        print("url:", url)
//        print("profile:", profile)
//        print("api:", api)
        
        let tokenOperation = TokenOperation()
        let noteOperation = NoteOperation()

        noteOperation.addDependency(tokenOperation)
        
        DispatchQueue.global().async {
            self.addOperations([
                tokenOperation,
                noteOperation,
            ], waitUntilFinished: true)
            
            DispatchQueue.main.async {
                self.delegate?.getNotes(noteOperation.notes)
            }
        }
        
    }
    
}

@MainActor
protocol RunOperationsDelegate: AnyObject {
    func getNotes(_ notes: [NoteModel])
}
