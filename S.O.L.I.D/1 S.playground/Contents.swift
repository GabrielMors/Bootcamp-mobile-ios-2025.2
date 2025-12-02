
// S - Single of responsability
// Cada classe/struct deve ter um unico motivo para mudar, ou seja, uma unica responsabilidade

// Exemplo ruim de (mistura de responsabilidades)
struct UserManager {
    
    func createUser(email: String, password: String) {
        
        // 1 - verifica e-mail
        if !email.contains("@") {
            print("O e-mail é inválido")
            return
        }
        
        // 2 - salva no banco
        save()
        
        // 3 - Enviar e-mail de boas-vindas
        print("Enviando e-mail de boas vindas")
        
    }
    
    func save() {
        // Logica aqui!!!
        print("Salvando no banco")
    }
    
}

// Aqui UserManager
// valida
// persiste
// envia e-mail

// Forma correta
struct User {
    let name: String
    let email: String
    let password: String
}

struct UserValidator {
    func isValidEmail(_ user: User) -> Bool {
        return user.email.contains("@")
    }
    
    func isValidPassword(_ user: User) -> Bool {
        return user.password.count > 3
    }
}

struct UserRepository {
    func save(_ user: User) {
        print("Salvando na base de dados")
    }
}

struct EmailService {
    func sendEmailWelcome(_ user: User) {
        print("Seja bem-vindo \(user.name)")
    }
}

struct UserService {
    
    private let validator: UserValidator
    private let userRepository: UserRepository
    private let emailService: EmailService
    
    init(
        validator: UserValidator,
        userRepository: UserRepository,
        emailService: EmailService
    ) {
        self.validator = validator
        self.userRepository = userRepository
        self.emailService = emailService
    }
    
    func createUser(user: User) {
        
        guard validator.isValidEmail(user) else {
            print("E-mail invalido!")
            return
        }
        
        guard validator.isValidPassword(user) else {
            print("A senha deve ter no min 4 carc")
            return
        }
        
        userRepository.save(user)
        
        emailService.sendEmailWelcome(user)
        
        print("Sucesso!")
    
    }
    
}


let userService = UserService(
    validator: UserValidator(),
    userRepository: UserRepository(),
    emailService: EmailService()
)

let user = User(name: "Vagner", email: "teste@email.com", password: "1234")
userService.createUser(user: user)


