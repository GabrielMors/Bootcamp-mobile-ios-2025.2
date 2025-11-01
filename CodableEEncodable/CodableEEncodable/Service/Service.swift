//
//  Service.swift
//  CodableEEncodable
//
//  Created by Vagner Reis on 30/10/25.
//

import Foundation

enum ApiError: Error {
    case urlError
    case dataError
    case requestError
    case requestDataError
    case httpURLResponseParserError
    case statusCodeError(Int)
    case decodableError
}

struct Service<T: Codable> {
    
    private let baseURLString = "https://6546b8acfe036a2fa955f7ad.mockapi.io/"
    
    private var session: URLSession {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Content-Type": "application/json"
        ]
        
        return URLSession(configuration: configuration)
    }
    
    func getAll(completion: @escaping (Result<[T], ApiError>) -> Void) {
        guard let url = URL(string: baseURLString + "user") else {
            completion(.failure(ApiError.urlError))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(ApiError.requestError))
                print("Erro na requisicao", error)
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse else {
                completion(.failure(ApiError.httpURLResponseParserError))
                print("Erro ao tentar fazer o cast para HTTPURLResponse")
                return
            }
            
            guard (200...204).contains(httpURLResponse.statusCode) else {
                completion(.failure(ApiError.statusCodeError(httpURLResponse.statusCode)))
                print("Erro ao tentar fazer a req, status code", httpURLResponse.statusCode)
                return
            }
            
            guard let data else {
                completion(.failure(ApiError.dataError))
                print("Erro no data")
                return
            }
            
            let decoder = JSONDecoder()
            let users = try? decoder.decode([T].self, from: data)
            
            completion(.success(users ?? []))
            print("Sucesso na requisicao")
            
        }
        
        task.resume()
    }
    
    func insert(model: T, completion: @escaping (Result<Bool, ApiError>) -> Void) {
        
        guard let url = URL(string: baseURLString + "user") else {
            completion(.failure(ApiError.urlError))
            return
        }
        
        let encoder = JSONEncoder()
        guard let userData = try? encoder.encode(model) else {
            completion(.failure(ApiError.dataError))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = userData
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(ApiError.requestError))
                print("Erro na requisicao", error)
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse else {
                completion(.failure(ApiError.httpURLResponseParserError))
                print("Erro ao tentar fazer o cast para HTTPURLResponse")
                return
            }
            
            guard (200...204).contains(httpURLResponse.statusCode) else {
                completion(.failure(ApiError.statusCodeError(httpURLResponse.statusCode)))
                print("Erro ao tentar fazer a req, status code", httpURLResponse.statusCode)
                return
            }
            
            completion(.success(true))
            print("Sucesso na requisicao")
            
        }
        
        task.resume()
        
    }
   
}

//    func parseJsonToModel() -> User? {
//
//        guard let jsonData = userJson.data(using: .utf8) else {
//            return nil
//        }
//
//        do {
//
//            let decoder = JSONDecoder()
//
//            let result = try decoder.decode(User.self, from: jsonData)
//
//            return result
//
//
//        } catch {
//            print("Erro ->>>", error)
//            return nil
//        }
//
//    }
//
//    func parseModelToData() -> Data? {
//        let user = User(name: "Vagner Reis", dateOfBirth: "10/10/200", address: Address(street: "Rua do Carmo", number: 10))
//
//        do {
//
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(user)
//            return data
//
//        } catch {
//            return nil
//        }
//
//    }

// GET
// POST
// DELETE
// PUT

// Camel case
// nomeDoUsusario

// snake case
// nome_do_usuario

// pascal case
// NomeDoUsusario

//let userJson = """
//    {
//        "name": "Vagner Reis",
//        "dateOfBirth": "10/10/200",
//        "address": {
//            "street": "Rua do Carmo",
//            "number": 10
//        }
//    }
//"""
