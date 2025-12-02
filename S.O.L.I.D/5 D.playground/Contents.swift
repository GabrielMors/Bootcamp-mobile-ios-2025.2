import Foundation

// D - Dependency Inversion Principle
// Em vez de uma classe depender diretamente de uma implementacao concreta, ela depende de protocolos

// Exemplo ruim
//struct APIClient {
//    func fetchUsers() {
//        print("Buncando usuarios")
//    }
//}
//
//struct UsersViewModel {
//
//    // Composição
//    private let apiClient = APIClient()
//
//    func load() {
//        apiClient.fetchUsers()
//    }
//
//}

// Exemplo correto
protocol APIClientProtocol {
    func fetchUsers() -> String
}

struct APIClientAzure: APIClientProtocol {
    func fetchUsers() -> String {
        // REAL
        // buscar dados do ussuario na base de dados
        // Espera 3 segundos nesse ex
        return """
        {
        "result": "APIClientAzure"
        }
"""
    }
}

struct MockAPIClient: APIClientProtocol {
    // Mock
    func fetchUsers() -> String {
        return """
        {
            "mock": "Aqui retornaria dados diferente"
        }
"""
    }
}

struct APIClientAWS: APIClientProtocol {
    // Mock
    func fetchUsers() -> String {
        return """
        {
           "result": "APIClientAWS"
        }
"""
    }
}

struct UserskViewModel {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetch() {
        let result = apiClient.fetchUsers()
        print(result)
    }
    
}

let client = APIClientAWS()

let viewModel = UserskViewModel(apiClient: client)
viewModel.fetch()
