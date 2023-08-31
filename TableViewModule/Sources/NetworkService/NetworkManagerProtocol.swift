//
//  File.swift
//  
//
//  Created by Лидия Ладанюк on 31.08.2023.
//

import Foundation

public protocol NetworkServiceProtocol: AnyObject {
    ///Получение данных модели
    /// - Parameters:
    ///   - completion: Обработчик завершения, в который возвращается результат выполнения функции.
    func fetchCars<T: Decodable>(completion: @escaping (Result<[T]?, Error>) -> Void)
}
