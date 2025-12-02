// O - Open/Closed Principle
// Uma classe/struct deve estar aberta para extensao mas fechada para modificacao

// Exemplo ruim de (Open/Closed Principle)

// Forma incorreta
// Sempre que aparecer um metodo diferente por ex transfer preciso adicionar a condicao
struct PaymentProcessorOLD {
    func process(method: String, amount: Double) {
        if method == "card" {
            print("Pagando com cartao")
        } else if method == "pix" {
            print("Pagando com pix")
        } else if method == "boleto" {
            print("Pagando com boleto")
        }
    }
}

// Forma correta
protocol PaymentMethod {
    func pay(amount: Double)
}

struct PixMethod: PaymentMethod {
    func pay(amount: Double) {
        print("pagando com PIX")
    }
}

struct Cardpayment: PaymentMethod {
    func pay(amount: Double) {
        print("pagando com cartao")
    }
}

struct PaymentProcess {
    func process(paymentMethod: PaymentMethod, amount: Double) {
        paymentMethod.pay(amount: amount)
    }
}

let pixMethod = PixMethod()
let cardMethod = Cardpayment()

// Imagina fitiramente surgir outra forma de pagamento, ex boleto

let paymentProcess = PaymentProcess()
paymentProcess.process(paymentMethod: cardMethod, amount: 400.00)



