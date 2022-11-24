//
//  NetworkManager.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Ozkan on 23.11.2022.
// 2faa2bdda699f241a1e3e8d7c9effaa1

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    private init() {}
    
    func download(url: URL, completion: @escaping (Result<Data,Error>) -> () ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                    
                }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL))) // Custom Error Enum
                return
            }
            
            completion(.success(data))

        }
    }
}
