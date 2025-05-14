//
//  homeVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class homeVC: UIViewController {
    let vm = viewModel()
    var user : String?

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
    
    
    @IBOutlet weak var CitiesCollectionView: UICollectionView!
    {
        didSet{
            let cell = UINib(nibName: "citiesCell", bundle: nil)
            CitiesCollectionView.register(cell, forCellWithReuseIdentifier: "cityCell")
            
            CitiesCollectionView.tag = 1
            CitiesCollectionView.delegate = self
            CitiesCollectionView.dataSource = self
            
        }
    }
    
    
    @IBOutlet weak var hotelsCollectionView: UICollectionView!
    {
        didSet{
            let cell = UINib(nibName: "hotelsCell", bundle: nil)
            hotelsCollectionView.register(cell, forCellWithReuseIdentifier: "hotelsCell")
            hotelsCollectionView.tag = 2
            hotelsCollectionView.dataSource = self
            hotelsCollectionView.delegate = self
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
        
        vm.didGetData = {[weak self] mess in
            DispatchQueue.main.async {
                self?.CitiesCollectionView.reloadData()
                self?.hotelsCollectionView.reloadData()
            }
        }
        vm.didGetError = {[weak self] mess in
            DispatchQueue.main.async {
                let alertvc = UIAlertController()
                alertvc.message = mess
                self?.present(alertvc,animated: true)
            }
        }
        

                // Bind ViewModel update callback
                vm.onResultsUpdated = { [weak self] in
                    DispatchQueue.main.async { [self] in
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
        
        view.bringSubviewToFront(stackButtons)
        view.bringSubviewToFront(trainButton)
        view.bringSubviewToFront(SearchBar)
        view.bringSubviewToFront(searchTableView)

    }

    @IBAction func SeeAllCities(_ sender: Any) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
              //  navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func SeeAllHotels(_ sender: UIButton) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func trainButtomPressed(_ sender: UIButton) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func hotelsButtomPressed(_ sender: UIButton) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    @IBAction func busButtomPressed(_ sender: UIButton) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
        
    }
    @IBAction func flightsButtomPressed(_ sender: UIButton) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func ferryButtomPressed(_ sender: UIButton) {
        let secondVC = cities()
        secondVC.CitiesData = vm.cityData
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
}

