//
//  AppDelegate.swift
//  CollectionHomeWork
//
//  Created by badyi on 29.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootView = Assembly.createDrawingsModule()
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        if let statusBarFrame = window?.windowScene?.statusBarManager?.statusBarFrame {
            let statusBarBackgroundView = UIView(frame: statusBarFrame)
            window?.addSubview(statusBarBackgroundView)
            statusBarBackgroundView.backgroundColor = .white
        }

        return true
    }

}

