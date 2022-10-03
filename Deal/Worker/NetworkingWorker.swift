//
//  NetworkingWorker.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation

class NetworkingWorker {

    enum NetworkError: Error {
        case invalidResponse
        case invalidStatusCode(Int)
    }
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get, completion: @escaping (Result<T, Error>) -> Void) {
         let completionOnMain: (Result<T, Error>) -> Void = { result in
             DispatchQueue.main.async {
                 completion(result)
             }
         }

         var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue

         let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
             
             if let error = error {
                 completionOnMain(.failure(error))
                 return
             }

             guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(NetworkError.invalidResponse)) }
             if !(200..<300).contains(urlResponse.statusCode) {
                 return completionOnMain(.failure(NetworkError.invalidStatusCode(urlResponse.statusCode)))
             }

             guard let data = data else { return }
             do {
                 let users = try JSONDecoder().decode(T.self, from: data)
                 completionOnMain(.success(users))
             } catch {
                 completionOnMain(.failure(error))
             }
         }
         urlSession.resume()
     }
}
