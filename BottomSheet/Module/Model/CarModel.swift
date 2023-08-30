//
//  CarModel.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import Foundation

struct CarModel: Decodable {
    let carName: String
    let description: String
    let rating: Double
    let ratingCount: Int
    let price: Int
}
