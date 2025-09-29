//
//  main.swift
//  POO
//
//  Created by Gabriel Mors Pulga on 15/09/25.
//

import Foundation

//MARK: - CLasse -> Modelo de um OBJETO
// Atributo / Propriedades = Caracteristicas de um objeto
// Ações = Funções / Métodos
// CLASSE TRABALHA COM REFERENCE TYPE

class Automovel {
    let cor: String = "Preto"
    let marca: String = "Ferrari"
    let conversivel: Bool = true
    var cavaloDePotencia: Int = 900
    
    func ligarCarro() {
        print("O carro da marca \(marca) está ligado")
    }
    
    func acenderFarois() {
        print("As luzes estão ligadas")
    }
    
    func detalheCompletoAutomovel() -> String {
        let texto: String = "O veiculo da marca \(marca), tem a cor \(cor), e, tem um total de \(cavaloDePotencia) cavalos de potencia"
        return texto
    }
}


// O objeto so ganha vida, quando geramos a sua instancia (que é o abre e fecha parenteses ()  )
var ferrari: Automovel = Automovel()
//print(ferrari.cavaloDePotencia)

var uno: Automovel = Automovel()
uno.cavaloDePotencia = 1500
//print(uno.cavaloDePotencia)

//MARK: - Construtores

class Pessoa {
    var nome: String
    var idade: Int
    var peso: Double
    var altura: Double
    
//    Método construtor -> Ele é quem seta/informa os valores inicias!!!
    init(nome: String, idade: Int, peso: Double, altura: Double) {
        self.nome = nome
        self.idade = idade
        self.peso = peso
        self.altura = altura
    }
}

var gabriel: Pessoa = Pessoa(nome: "Mors", idade: 30, peso: 80.5, altura: 1.78)
print(gabriel.peso)

var vagner: Pessoa = Pessoa(nome: "Vagner", idade: 49, peso: 80.5, altura: 1.78)
print(vagner.peso)

class Bolo {
    var peso: Double
    var preco: Double
    var sabor: [String]
    var eBom: Bool?
    
    init(peso: Double, preco: Double, sabor: [String]) {
        self.peso = peso
        self.preco = preco
        self.sabor = sabor
    }
    
    func adicionarSabor(sabor: String) {
        self.sabor.append(sabor)
    }
}

var boloAniversario: Bolo = Bolo(peso: 10, preco: 200, sabor: ["Chocolate", "Baunilha"])
boloAniversario.eBom = true

var boloCasamento: Bolo = Bolo(peso: 10, preco: 200, sabor: ["Chocolate", "Baunilha"])


//MARK: - Herança

//Classe PAI
class Animal {
    var nome: String
    var cor: String
    var peso: Double
    
    init(nome: String, cor: String, peso: Double) {
        self.nome = nome
        self.cor = cor
        self.peso = peso
    }
}


//Classe FILHA (Claase na qual HERDA as propriedade e métodos do pai)
// A classe filha contem TUDO OQUE O PAI CONTEM + OQUE ELA JA CONTEM
class Cachorro: Animal {
    var raca: String = "Golden"
    var porte: String
    
    init(porte: String, nome: String, cor: String, peso: Double) {
        self.porte = porte
        super.init(nome: nome, cor: cor, peso: peso)
    }
}

var zeus: Cachorro = Cachorro(porte: "Grande", nome: "Zeus", cor: "laranja", peso: 10)


// MARK: - Escapsulamento
//O escapsulamento é a prática de manter os detalhes de implementação

class Computador {
    private var armazenamento: Int
    var processador: String
    var memoriaRam: Int
    
    init(armazenamento: Int, processador: String, memoriaRam: Int) {
        self.armazenamento = armazenamento
        self.processador = processador
        self.memoriaRam = memoriaRam
    }
    
    // Função SET
    func melhoriaArmazenamento(armazenamentoNovo: Int) {
        if validaNovoArmazenamento(novoArmazenamento: armazenamentoNovo) {
            armazenamento = armazenamentoNovo
        }
    }
    
    // Função GET
    func getArmazenamento() -> Int {
        return armazenamento
    }
    
    
    private func validaNovoArmazenamento(novoArmazenamento: Int) -> Bool {
        let eValido: Bool = armazenamento < novoArmazenamento
        return eValido
    }
}

var meuComputador: Computador = Computador(armazenamento: 10, processador: "M4", memoriaRam: 18)
//GET
print(meuComputador.getArmazenamento())

//SET
meuComputador.melhoriaArmazenamento(armazenamentoNovo: 24)

//MARK: - Polimorfismo


class Veiculo {
    var velocidadeMaxima: Int
    
    init(velocidadeMaxima: Int) {
        self.velocidadeMaxima = velocidadeMaxima
    }
    
    func detalheDoVeiculo() -> String {
        return "Velocidade máxima: \(velocidadeMaxima) km/h"
    }
}


class Carro: Veiculo {
    
    override func detalheDoVeiculo() -> String {
        return "Gabriel"
//        super.detalheDoVeiculo()
    }
}

var corolla: Carro = Carro(velocidadeMaxima: 200)// Um OBJETO
corolla.detalheDoVeiculo()
print(corolla.detalheDoVeiculo())



class UIViewController {
    
    func viewDidLoad() {
        print(#function)
    }
}


final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//REFERENCE TYPE
class Mac {
    var modelo: String
    var ano: Int
    
    init(modelo: String, ano: Int) {
        self.modelo = modelo
        self.ano = ano
    }
}

var meuMac: Mac = Mac(modelo: "Macbook Pro M4", ano: 2024)
var GuilhermeMac: Mac = Mac(modelo: "Macbook Air M1", ano: 2021)


//print("-------------------------")
//print(meuMac.modelo)// M4
//print(GuilhermeMac.modelo)// m1
//print("-------------------------")
//
//meuMac = GuilhermeMac
//
//print(meuMac.modelo)// M1
//print(GuilhermeMac.modelo)// M1
//
//print("-------------------------")
//
//GuilhermeMac.modelo = "Macbook Pro 2017"
//
//print(meuMac.modelo)//2017
//print(GuilhermeMac.modelo)//2017
//
//print("-------------------------")
//
//print(meuMac.ano)//2021
//print(GuilhermeMac.ano)//2021
//
//print("-------------------------")
//
//meuMac.ano = 2010
//print(meuMac.ano)//2010
//print(GuilhermeMac.ano)//2010



// VALUE TYPE
struct Sobrado {
    var quantidadeDePortas: Int
    var quantidadeDeBanheiros: Int
    var emContrucao: Bool
}

var casaGabriel: Sobrado = Sobrado(quantidadeDePortas: 15, quantidadeDeBanheiros: 4, emContrucao: true)
var casaLeo: Sobrado = Sobrado(quantidadeDePortas: 20, quantidadeDeBanheiros: 8, emContrucao: false)



casaGabriel = casaLeo
print(casaGabriel.emContrucao)//False
print(casaLeo.emContrucao)//False
print(casaLeo.quantidadeDeBanheiros)//8

print("-------------------------")

casaLeo.quantidadeDeBanheiros = 10
print(casaLeo.quantidadeDeBanheiros)//10
print(casaGabriel.quantidadeDeBanheiros)//8

print("-------------------------")

