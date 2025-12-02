// I - Interface Segregation
// É melhor ter varios protocolos pequenos, especificas, do que um protocolo gigante que força a classe a implementar o que nao usam

// Exemplo ruim

//protocol Worker {
//    func work()
//    func eat()
//}
//
//class OfficeWorker: Worker {
//    func work() {
//        
//    }
//    
//    func eat() {
//        
//    }
//}
//
//class RobotWorker: Worker {
//    func work() {
//        
//    }
//    
//    func eat() {
//        // Errado!!!
//        print("Robos nao comem")
//    }
//}

// Forma correta

protocol Workeable {
    func work()
}

protocol Eatable {
    func eat()
}

class OfficeWorker: Workeable, Eatable {
    func work() {
        
    }
    
    func eat() {
        
    }
}

class RobotWorker: Workeable {
    func work() {
        
    }
}

func anyFunc(_ worker: Workeable) {
    
}

anyFunc(OfficeWorker())


