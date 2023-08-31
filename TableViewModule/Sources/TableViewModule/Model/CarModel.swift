//
//  CarModel.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import Foundation

struct CarModel: Decodable {
    ///Название модели автомобиля
    let carName: String
    
    ///Описание автомобиля
    let description: String
    
    ///Рейтинг автомобиля
    let rating: Double
    
    ///Количество оценок
    let ratingCount: Int
    
    ///Стоимость автомобиля в сутки
    let price: Int
}
