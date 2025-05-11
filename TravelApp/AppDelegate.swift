//
//  AppDelegate.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let homevc = homeVC()
        let navController = UINavigationController(rootViewController: homevc)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}

