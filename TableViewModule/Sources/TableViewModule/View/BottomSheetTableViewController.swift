//
//  BottomSheetTableViewController.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import UIKit

public final class BottomSheetTableViewController: UITableViewController {
    
    //MARK: - Public properties
    public var presenter: BottomSheetTableViewPresenter?
    
    // MARK: - LifeCycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            BottomSheetTableViewCell.self,
            forCellReuseIdentifier: BottomSheetTableViewCell.identifier
        )
    }
    
    // MARK: - UITableViewDataSource
    public override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 326
    }
    
    public override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    public override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: BottomSheetTableViewCell.identifier,
            for: indexPath
        ) as? BottomSheetTableViewCell
        
        guard
            let tableViewCell = cell,
            let carModel = presenter?.carModel?[indexPath.row]
        else { return UITableViewCell() }
        tableViewCell.configure(with: carModel)
        
        return tableViewCell
    }
}

    // MARK: - Extension
extension BottomSheetTableViewController {
    ///Обновление данных таблице, при успешном получении данных из сети.
    func success() {
        tableView.reloadData()
    }
    
    ///Вывод описания ошибки на консоль, при ошибочной загрузке данных из сети.
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
