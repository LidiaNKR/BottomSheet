//
//  BottomSheetTableViewPresenter.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import Foundation
import NetworkService

public final class BottomSheetTableViewPresenter {
    private weak var view: BottomSheetTableViewController?
    private let networkService: NetworkServiceProtocol
    var carModel: [CarModel]?
    
    public init(view: BottomSheetTableViewController, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        fetchCars()
    }
    
    ///Получение данных модели CarModel из сети.
    private func fetchCars() {
        networkService.fetchCars { (result: Result<[CarModel]?, Error>) in
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
    
    ///Количество строк в секции (количетсву элементов в массиве модели CarModel).
    func numberOfRows() -> Int {
        return carModel?.count ?? 0
    }
}


