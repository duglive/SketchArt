//
//  Assembly.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import UIKit

final class Assembly {
    static func createDrawingsModule() -> DrawingsViewController {
        let view = DrawingsView()
        let controller = DrawingsViewController(with: view)
        view.delegate = controller
        return controller
    }
}
