//
//  homeVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class homeVC: UIViewController {
    let vm = viewModel()

    @IBOutlet weak var ticketView: UIView!
    
    private func setupBackgroundImage(){
        if let image = UIImage(named: "teal-color-solid-background-1920x1080"){viewContainer.backgroundColor = UIColor(patternImage: image)}

      //  viewContainer.alpha = 0.7
        let gradient = CAGradientLayer()
        gradient.frame = viewContainer.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(1).cgColor,
                           UIColor.white.withAlphaComponent(0).cgColor,
                           ]
        gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.0)

//        viewContainer.layer.mask = gradient
        viewContainer.layer.insertSublayer(gradient, at: 0)

            
    }
    @IBOutlet weak var viewContainer: UIView!{
        didSet{
            setupBackgroundImage()
        }
    }
    
    
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
    @IBOutlet weak var CitiesCollectionView: UICollectionView!
    {
        didSet{
            let cell = UINib(nibName: "citiesCell", bundle: nil)
            CitiesCollectionView.register(cell, forCellWithReuseIdentifier: "cityCell")
            CitiesCollectionView.delegate = self
            CitiesCollectionView.dataSource = self
            
        }
    }
    
    @IBOutlet weak var searchTableView: UITableView!
    {
        didSet{
            let cell = UINib(nibName: "searchTableCell", bundle: nil)
            searchTableView.register(cell, forCellReuseIdentifier: "searchTableCellId")
            searchTableView.isHidden = true
            searchTableView.dataSource = self
            searchTableView.delegate = self
        }
    }
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var SearchBar: UISearchBar!{
        didSet{
//            SearchBar.showsCancelButton = true
            SearchBar.delegate = self
            SearchBar.isUserInteractionEnabled = true

        }
    }
    
    @IBOutlet weak var stackButtons: UIStackView!
   
   
    @IBOutlet weak var trainButton: UIButton!

    @IBOutlet weak var busButton: UIButton!
    @IBOutlet weak var ferryButton: UIButton!
    @IBOutlet weak var hotelButton: UIButton!
    @IBOutlet weak var flyButton: UIButton!
    @IBOutlet weak var flyLabel: UILabel!
    @IBOutlet weak var hotellabel: UILabel!
    @IBOutlet weak var trainLabel: UILabel!
    @IBOutlet weak var ferryLabel: UILabel!
    @IBOutlet weak var busLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubviewToFront(stackButtons)
        view.bringSubviewToFront(trainButton)
        vm.didGetData = {[weak self] mess in
            DispatchQueue.main.async {
                self?.CitiesCollectionView.reloadData()
            }
        }
        vm.didGetError = {[weak self] mess in
            DispatchQueue.main.async {
                let alertvc = UIAlertController()
                alertvc.message = mess
                self?.present(alertvc,animated: true)
            }
        }
        view.bringSubviewToFront(searchTableView)

                // Bind ViewModel update callback
                vm.onResultsUpdated = { [weak self] in
                    DispatchQueue.main.async {
                        self?.searchTableView.reloadData()
                    }
                }
        // Do any additional setup after loading the view.
        let ticketView = FlightTicketView()
                ticketView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(ticketView)

                NSLayoutConstraint.activate([
                    ticketView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    ticketView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    ticketView.widthAnchor.constraint(equalToConstant: 300),
                    ticketView.heightAnchor.constraint(equalToConstant: 120),
                    ticketView.topAnchor.constraint(equalTo: SearchBar.bottomAnchor, constant: 10)
                ])
        vm.fetchData()
        view.bringSubviewToFront(SearchBar)
        view.bringSubviewToFront(searchTableView)
        

    }

    @IBAction func SeeAllCities(_ sender: Any) {
    }
    @IBAction func SeeAllHotels(_ sender: UIButton) {
    }
    


}


extension homeVC : UITabBarDelegate{
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
