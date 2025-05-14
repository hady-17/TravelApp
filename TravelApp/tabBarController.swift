//
//  tabBarController.swift
//  TravelApp
//
//  Created by hady ka on 14/05/2025.
//

import Foundation
import UIKit

class TabBarBuilder {
    static func createTabBarController() -> UITabBarController {
        let accSB = UIStoryboard(name: "account", bundle: nil)
        let accVC = accSB.instantiateViewController(withIdentifier: "accountID")
        accVC.tabBarItem.image = UIImage(systemName: "person.circle")
        accVC.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        accVC.tabBarItem.title = "Account"

        let dealSB = UIStoryboard(name: "deal", bundle: nil)
        let dealVC = dealSB.instantiateViewController(withIdentifier: "dealID")
        dealVC.tabBarItem.image = UIImage(systemName: "percent")
        dealVC.tabBarItem.selectedImage = UIImage(systemName: "percent.fill")
        dealVC.tabBarItem.title = "Deals"

        let orSB = UIStoryboard(name: "orders", bundle: nil)
        let orVC = orSB.instantiateViewController(withIdentifier: "orderID")
        orVC.tabBarItem.image = UIImage(systemName: "ticket")
        orVC.tabBarItem.selectedImage = UIImage(systemName: "ticket.fill")
        orVC.tabBarItem.title = "Orders"

        let homeVC = homeVC()
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        homeVC.tabBarItem.title = "Home"

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, orVC, dealVC, accVC]

        return tabBarController
    }
}
