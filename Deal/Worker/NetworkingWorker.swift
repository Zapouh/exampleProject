//
//  NetworkingWorker.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation

class NetworkingWorker {

    enum NetworkError: Error {
        case unknown
        case unauthorized
        case noResponse
        case invalidResponse
        case invalidStatusCode(Int)
    }
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get) async -> Result<T, Error> {
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(NetworkError.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    return .failure(NetworkError.invalidResponse)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(NetworkError.unauthorized)
            default:
                return .failure(NetworkError.invalidStatusCode(response.statusCode))
            }
        } catch {
            return .failure(NetworkError.unknown)
        }
    }
    
    func fetchCities() async throws -> [Cities] {
      
        return []
    }
}
