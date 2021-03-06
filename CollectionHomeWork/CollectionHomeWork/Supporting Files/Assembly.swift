//
//  Assembly.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import UIKit

final class Assembly {
    static var pictures: [PictureModel] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 ,24].map { PictureModel(with: UIImage(named: "\($0)")!)
    }
    
    static func createDrawingsModule() -> DrawingsViewController {
        let view = DrawingsView()
        let controller = DrawingsViewController(with: view)
        view.delegate = controller
        return controller
    }
    
    static func pushDrawingcVC() {
        let delegate = UIApplication.shared.delegate?.window!
        guard let window = delegate else { return }
        
        window.rootViewController = UINavigationController(rootViewController: Assembly.createDrawingsModule())
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {}, completion:
        { completed in
            if let statusBarFrame = window.windowScene?.statusBarManager?.statusBarFrame {
                DConstants.statusBarHeight = statusBarFrame.height
                let statusBarBackgroundView = UIView(frame: statusBarFrame)
                window.addSubview(statusBarBackgroundView)
                statusBarBackgroundView.backgroundColor = .white
            }
        })
    }
}
