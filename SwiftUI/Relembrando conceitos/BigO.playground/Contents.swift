import Foundation

// MARK: Big-O

// O que é Big-O?

// Big-O (Notação O) é uma forma de medir a complexidade de um algoritmo,
// ou seja, quanto tempo ou memória ele consome conforme a quantidade de dados aumenta.

// MARK: Arrays

// O que é um Array? Quando devemos usá-lo?

// Um Array é uma coleção ordenada de elementos "DO MESMO TIPO"

// Mantém a ordem
// Permite duplicados
// Acesso por índice
// É uma struct (Value Type)

//typealias TipoDoArray = [Any]
//
//var itens: TipoDoArray = [
//    10 as Double,
//    20 as Float,
//    "teste" as String
//]

// Operacoes dentro de um array?

// Acessar por indice: O(1)
// Ex
let arrayPorIndices /*: [Int]*/ = [ // -> Inferencia de tipo
    "Ana",
    "Pedro"
]

print("Acessando por indice: ", arrayPorIndices[0]) // == Ana, Muito rapido,
//indiferente da quantidade que tenha no array

// Inserir no final: O(1)
// Ex
var arrayInserirNoFinal /*: [Int]*/ = [ // -> Inferencia de tipo
    "Ana",
    "Pedro"
]

arrayInserirNoFinal.append("Manuel")

print("Inserir no final: ", arrayInserirNoFinal[2]) // == Manuel, Muito rapido,
//indiferente da quantidade que tenha no array, porque ele ja sabe onde fica a ultima posicao

// Inserir no meio: O(n)
// Ex
var arrayInserirNoMeio /*: [Int]*/ = [ // -> Inferencia de tipo
    "Ana",
    "Pedro"
]

arrayInserirNoMeio.insert("Manuel", at: 0)

print("Inserir no Meio/Inicio: ", arrayInserirNoMeio[0]) // == Manuel, Demorado, depende do tanto de item que tem no array, porque precisa reordenar a lista inteira, ou seja, quanto mais itens mais demorado

// Posso remover: O(n)
// Ex
var arrayRemover/*: [Int]*/ = [ // -> Inferencia de tipo
    "Ana",
    "Pedro",
    "Aline",
    "Maria"
]

arrayRemover.remove(at: 0)

print("Remover: ", arrayRemover[0]) // == Pedro, Demorado, Precisa reordenar a lista inteira

// Posso buscar: O(n)
// Ex
let arrayBuscar/*: [Int]*/ = [ // -> Inferencia de tipo
    "Ana",
    "Pedro",
    "Aline",
    "Maria"
]

let arrayBuscarASerBuscado = "Pedro"

// Forma 1
for item in arrayBuscar {
    if item == arrayBuscarASerBuscado {
        print("Encontrou o array =, imagina se eu estivese na posicao 1000000")
    }
}

// Forma 2

let arrayBuscarEncontrado = arrayBuscar.contains(arrayBuscarASerBuscado)
print("Encontrou o \(arrayBuscarEncontrado) , Buscas internas em array sao demoradas, pois nao tem hash")

// MARK: Dicionario

// Qual a diferença entre um dicionario e um array?

// O Array trabalha com indice, e o dicionario por hash (isso falando de busca)
// Nao é ordenado! (até o Swift manter a ordem de insercao, mas nao é garantido semanticamente)
// Acesso por chave

// Remover: O(1)
// Buscar: O(1)

// MinhaChave == 8b805d241cf5b379ced50ffb185607162a5866af690e7c7df80e3e3b54909ba0

class MinhaClass {}
var dicionarioRemover: Dictionary<String, Int> = [
    "Pedro": 30,
    "Ana": 22,
    "Igor": 44
]

dicionarioRemover.removeValue(forKey: "Pedro")
print("Dicionario apos a remocao, Muito rapido pois é por hash,", dicionarioRemover)

// Rapido buscar
print("Muito rapido pelo mesmo motivo citado acima", String(describing: dicionarioRemover["Ana"]))

// MARK: Dicionario
// Qual a diferença entre um Set e um array?

// Nao pode ter elementos duplicados
// Nao precisa de ordem
// Quer buscas mais rapidas

let meuArray = [
    "Ana",
    "Pedro",
    "Ana"
]

print("Antes", meuArray)
// Converter Para SET:

let meuSet = Set(meuArray)
print("Depois", meuSet)

struct ClienteDoMes: Hashable {
    let cliendId: Int
    let name: String
    let address: String
    let date: String
    
    static func == (lhs: ClienteDoMes, rhs: ClienteDoMes) -> Bool {
        if lhs.cliendId == rhs.cliendId && lhs.name == rhs.name {
            if lhs.address != rhs.address {
                // tomar alguma acao porem nao vou dizer que e diferente, por exe, vou colocar o badge na tela so informando que o ussuario mudou de endereco
                print("Mudou de endereco porem e o mesmo cliente")
            }
            return true
        }
        
        return false
    }
}

let cl1 = ClienteDoMes(cliendId: 10, name: "Joao", address: "rua 1", date: "01/03/2026")
//let cl2 = ClienteDoMes(cliendId: 11, name: "Maria", date: "01/03/2026")
let cl3 = ClienteDoMes(cliendId: 10, name: "Joao", address: "rua 2", date: "01/03/2026")

print(cl1.hashValue)
print(cl3.hashValue)

if cl1 == cl3 {
    print("é o mesmo cliente")
} else {
    print("Nao é")
}

let tamanho = 1_000_000

let array = Array(0..<tamanho)
let set = Set(array)
let dicionario = Dictionary(uniqueKeysWithValues: array.map { ( $0, $0) })

let elementoBuscado = tamanho - 1

func medirTempo(_ target: String, _ bloco: () -> Void) {
    let inicio = Date.now.timeIntervalSince1970
    bloco()
    let final = Date.now.timeIntervalSince1970
    print("\(target) Tempo percorrido = \(final - inicio) segundos")
}

// Medindo tempo do set
medirTempo("SET") {
    _ = set.contains(elementoBuscado)
}
DispatchQueue.main.asyncAfter(wallDeadline: .now() + .seconds(2)) {
    // Medindo tempo do Array
    medirTempo("ARRAY") {
        _ = array.contains(elementoBuscado)
    }
}


DispatchQueue.main.asyncAfter(wallDeadline: .now() + .seconds(5)) {
    // Medindo tempo do Dicionario
    medirTempo("DICIONARIO") {
        _ = dicionario[elementoBuscado]
    }
}
