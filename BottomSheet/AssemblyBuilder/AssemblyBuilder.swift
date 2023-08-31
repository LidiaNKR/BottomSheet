//
//  AssemblyBuilder.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 31.08.2023.
//

import UIKit
import AssemblyBuilder
import TableViewModule
import NetworkService

final class AssemblyBuilder: AssemblyBuilderProtocol {
    func createTableViewModule() -> UITableViewController {
        let view = BottomSheetTableViewController()
        let networkService = NetworkService()
        let presenter = BottomSheetTableViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
