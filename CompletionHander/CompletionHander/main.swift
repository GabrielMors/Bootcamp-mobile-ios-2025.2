//
//  main.swift
//  CompletionHander
//
//  Created by Gabriel Mors Pulga on 10/11/25.
//

import Foundation

// Diferença entre closure normal e @escaping closure

//closure normal
//Ela começa e termina antes da função terminar
// O proprio Swift sabe exatamente quando ela será executada, então ele nao precisa mante-la viva depois

//@escaping closure
//Precisa mantê-la viva na memória, porque ela será usada depois que a função ja retornou


// Um Completion Handler é basicamente uma closure usada como parâmetro de uma função para ser executada quando essa função terminar uma tarefa -? Normalmente uma tarefa assíncrona

// "Função que lida com a conclusão"



struct ExploreService {
    
    func getTest() -> Void {
        return
    }
    
    func getJSON() -> Int {
        return 1000
    }
    
    func loadJSON(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            
            completion(12387268712346)
        }
    }
    
}
var service = ExploreService()

print(service.getJSON())

service.loadJSON { value in
    print(value)
}
print("Testeeeee")


RunLoop.main.run(until: Date().addingTimeInterval(10))
