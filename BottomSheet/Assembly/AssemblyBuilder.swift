//
//  AssemblyBuilderProtocol.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    static func createTableViewModule() -> UITableViewController
}

final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    static func createTableViewModule() -> UITableViewController {
        let view = BottomSheetTableViewController()
        let networkService = NetworkService()
        let presenter = BottomSheetTableViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
