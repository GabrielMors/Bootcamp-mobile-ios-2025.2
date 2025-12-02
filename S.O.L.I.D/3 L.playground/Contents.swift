// L - Liskov Substituion Principle
// Se B herda de A, voce deve poder usar B no lugar de A sem quebrar nada
// ou seja, a subclasse nao pode "estragar" o contrato da classe

// Exemplo ruim. Passaro que nao voa
//class Bird {
//    
//    func fly() {
//        print("Voando...")
//    }
//    
//}
//
//class Eagle: Bird { }
//
//class Pinguim: Bird {
//    
//    override func fly() {
//        print("")
//    }
//    
//}

// Forma correta
protocol Bird {
    func eat()
}

// Aqui esta acontecendo a segregacao de interface
protocol FlyingBird: Bird {
    func fly()
}

class Eagle: FlyingBird {
    func fly() {
        
    }
    
    func eat() {
        
    }
}

class Pinguim: Bird {
    func eat() {
        
    }
}
