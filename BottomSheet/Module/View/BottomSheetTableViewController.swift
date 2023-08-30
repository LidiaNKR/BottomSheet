//
//  BottomSheetTableViewController.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import UIKit

protocol BottomSheetTableViewProtocol: AnyObject {
    ///Обновление данных в таблице, при успешном получении данных из сети.
    func success()
    
    ///Вывод описания ошибки на консоль, при ошибочной загрузке данных из сети.
    func failure(error: Error)
}

final class BottomSheetTableViewController: UITableViewController {
    
    //MARK: - Public properties
    var presenter: BottomSheetTableViewPresenterProtocol!
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            BottomSheetTableViewCell.self,
            forCellReuseIdentifier: BottomSheetTableViewCell.identifier
        )
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 326
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return presenter.numberOfRows()
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: BottomSheetTableViewCell.identifier,
            for: indexPath
        ) as? BottomSheetTableViewCell
        
        guard
            let tableViewCell = cell,
            let carModel = presenter.carModel?[indexPath.row]
        else { return UITableViewCell() }
        tableViewCell.configure(with: carModel)
        
        return tableViewCell
    }
}

extension BottomSheetTableViewController: BottomSheetTableViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
