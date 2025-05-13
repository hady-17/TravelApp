//
//  homeVC+elements.swift
//  TravelApp
//
//  Created by hady ka on 01/05/2025.
//

import Foundation
import UIKit
extension homeVC :  UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        SearchBar.showsCancelButton = true
        
        searchTableView.isHidden = false
        vm.filterDestinations(with: searchBar.text ?? "")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        vm.filterDestinations(with: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        SearchBar.showsCancelButton = false
        SearchBar.text = ""
        SearchBar.resignFirstResponder()
        searchTableView.isHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.filteredDestinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchTableCellId") as! searchTableCell
        cell.cityLabel.text = vm.filteredDestinations[indexPath.row].title
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = CityDetailsVC()
        nextVC.Data = vm.cityData?[indexPath.row]
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
        
        
    }
    
    
}
