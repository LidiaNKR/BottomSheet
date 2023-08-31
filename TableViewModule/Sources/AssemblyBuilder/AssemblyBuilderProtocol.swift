//
//  AssemblyBuilderProtocol.swift
//  BottomSheet
//
//  Created by Лидия Ладанюк on 30.08.2023.
//

import UIKit

public protocol AssemblyBuilderProtocol: AnyObject {
    ///Сборка TableView модуля
     func createTableViewModule() -> UITableViewController
}
