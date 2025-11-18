//
//  Closure.swift
//  CompletionHander
//
//  Created by Gabriel Mors Pulga on 10/11/25.
//

import Foundation

// Uma closure é uma função que pode guardar, enviar e executar depois

//MARK: Exemplo simples

let saudacao = {
    print( "Oi, mundo!" )
}

//saudacao() Oi, mundo!



//MARK: Closure com parâmetro e retorno

let soma = { (a: Int, b: Int) -> Int in
    return a + b
}

let resultado = soma(10, 20)
//print(resultado)


//MARK: Forma simplificada

let soma2: (Int, Int) -> Int = { $0 + $1 }
//print(soma2(10,20))

// $0 é o primeiro parâmentro
// $1 é o segundo parâmentro
// $2,3 e assim por diante

let numeros = [1,2,3,4,5,6]
let dobrados = numeros.map { $0 * 2 }



//MARK: Closure com parâmetro de função
// Closures são muito usadas como callbacks (ações que acontecem depois que algo termina)

func executarDepois(acao: () -> Void) -> Void {
    print("Antes da ação")
    acao()
    print("Depois da ação")
}


//executarDepois {
//    print( "Executando a closure/ação")
//}

//Antes da ação
//Executando a closure/ação
//Depois da ação
