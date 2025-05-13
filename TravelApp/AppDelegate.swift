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
<<<<<<< HEAD
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = signInVC()
=======
        
        let accSB = UIStoryboard(name: "account", bundle: nil)
        let accVC = accSB.instantiateViewController(withIdentifier: "accountID")
        accVC.tabBarItem.image = UIImage(systemName: "person.circle")
        accVC.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        accVC.tabBarItem.title = "account"
        
        let dealSB = UIStoryboard(name:"deal", bundle: nil)
        let dealVC = dealSB.instantiateViewController(withIdentifier: "dealID")
        dealVC.tabBarItem.image = UIImage(systemName: "percent.ar")
        dealVC.tabBarItem.selectedImage = UIImage(systemName: "percent")
        dealVC.tabBarItem.title = "Deals"
        
        let orSB = UIStoryboard(name: "orders", bundle: nil)
        let orVC = orSB.instantiateViewController(withIdentifier: "orderID")
        orVC.tabBarItem.image = UIImage(systemName: "ticket")
        orVC.tabBarItem.selectedImage = UIImage(systemName: "ticket.fill")
        orVC.tabBarItem.title = "Orders"
      
        window = UIWindow(frame: UIScreen.main.bounds)
        let homevc = homeVC()
        homevc.tabBarItem.image = UIImage(systemName: "house")
        homevc.tabBarItem.title = "home"
        homevc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
                                       
        
        let tbc = UITabBarController()
        tbc.viewControllers = [homevc,orVC,dealVC,accVC]
//        let navController = UINavigationController(rootViewController: homevc)
        window?.rootViewController = tbc
>>>>>>> e5a06df6c0e1dc283366bd0fb88bec921bdd88fc
        window?.makeKeyAndVisible()
        return true
    }
}

