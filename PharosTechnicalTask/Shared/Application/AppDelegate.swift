//
//  AppDelegate.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 16/08/2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startApp()
        return true
    }
    
    func startApp() {
        AppAppearance.shared.setupAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: StockListVC())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
