//
//  BottomSheetTableViewPresenter.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import Foundation

protocol BottomSheetTableViewPresenterProtocol: AnyObject {
    ///Модель данных автомобилей
    var carModel: [CarModel]? { get }
    
    ///Получение данных об автомобилях из сети
    func fetchCars()
    
    ///Получение количества элементов(автомобилей)
    func numberOfRows() -> Int
}

final class BottomSheetTableViewPresenter: BottomSheetTableViewPresenterProtocol {
    weak var view: BottomSheetTableViewProtocol?
    let networkService: NetworkServiceProtocol
    var carModel: [CarModel]?
    
    required init(view: BottomSheetTableViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        fetchCars()
    }
    
    func fetchCars() {
        networkService.fetchCars { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let carModel) :
                    self.carModel = carModel
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func numberOfRows() -> Int {
        return carModel?.count ?? 0
    }
}


