//
//  GPTService.swift
//  ChatGPT
//
//  Created by Vagner Reis on 05/11/25.
//

import Foundation

enum ApiErrors: Error {
    case urlParseError
    case httpCastError
    case statusCodeError(Int)
}

struct GPTService {
    
    static let shared = GPTService()
    
    private let baseURL = URL(string: "https://api.openai.com")
    
    private var session: URLSession {

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Content-Type" : "application/json",
            "Authorization": "Bearer \(Keys.OPENAI_API_KEY)"
        ]
        
        return URLSession(configuration: configuration)
        
    }
    
    private init() {
        // Singleton
    }
    
    // Nao pode acontecer na thread principal
    func requestText(with request: GPTRequestModel) async throws -> GPTResponseModel {
        
        guard let completeURL = baseURL?.appending(component:"v1").appending(component: "responses") else {
            throw ApiErrors.urlParseError
        }
        
        var urlRequest = URLRequest(url: completeURL)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try JSONEncoder().encode(request)
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw ApiErrors.httpCastError
        }
        
        let stausCode = response.statusCode
        
        guard (200...299).contains(stausCode) else {
            throw ApiErrors.statusCodeError(stausCode)
        }
        
        let decoder = JSONDecoder()
        
//        let stringValue = String(data: data, encoding: .utf8)
//        print("MODEL STRING", stringValue)
        
        let model = try decoder.decode(GPTResponseModel.self, from: data)
        
        return model
        
    }
    
    //    func requestText(with request: GPTRequestModel, closure: @escaping (respostaDesejada) -> ()) {
    //
    //        guard let completeURL = baseURL?.appending(component: "v1/responses") else {
    //            return
    //        }
    //
    //        var urlRequest = URLRequest(url: completeURL)
    //        urlRequest.httpMethod = "POST"
    //        urlRequest.httpBody = try? JSONEncoder().encode(request)
    //
    //        let task = session.dataTask(with: urlRequest) { data, response, error in
    //            closure(respostaDesejada)
    //        }
    //
    //        task.resume()
    //
    //    }
    
    //    @discardableResult
    //    func test() -> Int { 0 }
    
}
