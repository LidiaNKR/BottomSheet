//
//  NetworkService.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchCars(completion: @escaping (Result<[CarModel]?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func fetchCars(completion: @escaping (Result<[CarModel]?, Error>) -> Void) {
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
                let decodedData = try JSONDecoder().decode([CarModel].self, from: jsonData)
                completion(.success(decodedData))
                print(decodedData)
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
