//
//  homeVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class homeVC: UIViewController {
    
    private func setupBackgroundImage(){
        if let image = UIImage(named: "teal-color-solid-background-1920x1080"){viewContainer.backgroundColor = UIColor(patternImage: image)}

      //  viewContainer.alpha = 0.7
        let gradient = CAGradientLayer()
        gradient.frame = viewContainer.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(1).cgColor,
                           UIColor.white.withAlphaComponent(0).cgColor,
                           ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        viewContainer.layer.mask = gradient
            
    }
    @IBOutlet weak var viewContainer: UIView!
    
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
        setupBackgroundImage()
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
