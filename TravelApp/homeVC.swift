//
//  homeVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class homeVC: UIViewController {

    @IBOutlet weak var tabBarAccountButton: UITabBarItem!
    {
        didSet{
            tabBarAccountButton.tag = 4
            tabBarAccountButton.image = UIImage(systemName: "person.circle")
            tabBarAccountButton.selectedImage = UIImage(systemName: "person.circle.fill")
        }
    }
    @IBOutlet weak var tabBarDealsButton: UITabBarItem!
    {
        didSet{
            tabBarDealsButton.tag = 3
            tabBarDealsButton.image = UIImage(systemName: "percent.ar")
            tabBarDealsButton.selectedImage = UIImage(systemName: "percent")
        }
    }
    @IBOutlet weak var tabBarOrdersButton: UITabBarItem!
    {
        didSet{
            tabBarOrdersButton.tag = 2
            tabBarOrdersButton.image = UIImage(systemName: "ticket")
            tabBarOrdersButton.selectedImage = UIImage(systemName: "ticket.fill")
        }
    }
    @IBOutlet weak var TabBarHomeButton: UITabBarItem!
    {
        didSet{
            TabBarHomeButton.tag = 1
            TabBarHomeButton.image = UIImage(systemName: "house")
            TabBarHomeButton.selectedImage = UIImage(systemName: "house.fill")
        }
    }
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var SearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension homeVC : UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1{
            print("home")
        }
        else if item.tag == 2{
            print("Orders")
        }
        else if item.tag == 3 {
            print("Deals")
        }
        else{
            print("account")
        }
    }
    
}
