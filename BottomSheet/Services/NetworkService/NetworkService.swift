//
//  NetworkService.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import Foundation
import NetworkService

final class NetworkService: NetworkServiceProtocol {
    public func fetchCars<T: Decodable>(completion: @escaping (Result<[T]?, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "carModel", withExtension: "json") else {
            print("Failed to find JSON file")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let jsonData = data else {
                print("No data found")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([T].self, from: jsonData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


