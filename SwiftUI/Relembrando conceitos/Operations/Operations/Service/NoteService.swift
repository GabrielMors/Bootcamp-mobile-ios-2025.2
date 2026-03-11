//
//  NoteService.swift
//  Operations
//
//  Created by Vagner Reis on 09/03/26.
//

import Foundation

struct NoteService {
    
    func getNotes(tokenModel: TokenModel) -> [NoteModel] {
        
        sleep(2)
        
        return [
            NoteModel(
                title: "Comprar mantimentos",
                description: "Comprar leite, pão, ovos e frutas no mercado.",
                token: tokenModel
            ),
            NoteModel(
                title: "Estudar SwiftUI",
                description: "Revisar conceitos de @State, @Binding e NavigationStack.",
                token: tokenModel
            ),
            NoteModel(
                title: "Treinar C++",
                description: "Estudar ponteiros e gerenciamento de memória.",
                token: tokenModel
            ),
            NoteModel(
                title: "Preparar aula",
                description: "Montar exemplos de SwiftUI para a próxima aula.",
                token: tokenModel
            ),
            NoteModel(
                title: "Projeto pessoal",
                description: "Continuar desenvolvimento do leitor de PDF em C++.",
                token: tokenModel
            )
        ]
    }
    
}
