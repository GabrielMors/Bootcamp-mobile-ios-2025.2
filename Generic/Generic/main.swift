//
//  main.swift
//  Generic
//
//  Created by Gabriel Mors Pulga on 10/11/25.
//

import Foundation

//MARK: Exemplo de classe com propriedade generica passando pelo construtor

class Caixa<Valor> {
    
    var item: Valor
    
    init(item: Valor) {
        self.item = item
    }
    
    func mostrarItem() {
        print("O item na caixa é: \(item)")
    }
}

let caixaDeNumero = Caixa(item: 45)
let caixaDeTexto = Caixa(item: "Gabriel Mors")
caixaDeNumero.mostrarItem()
caixaDeTexto.mostrarItem()


//MARK: Função com genericos

func mostrarConteudo<T>(conteudo: T) {
    print("Conteúdo: \(conteudo)")
}

mostrarConteudo(conteudo: "Olá, mundo!")
mostrarConteudo(conteudo: 30)
mostrarConteudo(conteudo: true)


//MARK: Tratamento para generico

func mostrarConteudoIFLet<T>(conteudo: T) {
    if let numero = conteudo as? Int {
        print("Isso é um numero: \(numero)")
    } else if let texto = conteudo as? String {
        print("Isso é um texto: \(texto)")
    } else {
        print("Não é nem um numero nem um texto")
    }
}

mostrarConteudoIFLet(conteudo: "Ola mundo")
mostrarConteudoIFLet(conteudo: 22)
mostrarConteudoIFLet(conteudo: true)


func mostrarConteudoSwitchCase<T>(conteudo: T) {
    switch conteudo {
    case let numero as Int:
        print("Isso é um numero: \(numero)")
    case let texto as String:
        print("Isso é um texto: \(texto)")
    default:
        print("Não é nem um numero nem um texto")
    }
}

