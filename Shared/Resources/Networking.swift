//
//  Networking.swift
//  The Games
//
//  Created by William Santoso on 12/08/21.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case encodingError
    case noData
    case notLogin
    case errorMessage(String)
    case statusCode(Int)
}

class Networking {
    static let shared = Networking()
    
    let apiKey = "e07d0723795c4dfc8130cbcaf6083be6"
    
    static func getData<T : Codable>(from urlString: String, completion: @escaping ((Result<T, NetworkError>), URLResponse?) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(.badUrl), nil)
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(urlString)
                return completion(.failure(.noData), response)
            }
            
            guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                print(urlString)
                print(String(data: data, encoding: .utf8) ?? "no data")
                return completion(.failure(.errorMessage(data.jsonToString())), response)
            }
            completion(.success(decoded), response)
        }.resume()
    }
}
