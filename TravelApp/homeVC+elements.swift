//
//  homeVC+elements.swift
//  TravelApp
//
//  Created by hady ka on 01/05/2025.
//

import Foundation
import UIKit
extension homeVC : UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    


        
//        searchBar.delegate = self
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        tableView.isHidden = true
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



//
//    // Optional: Handle selection
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        searchBar.text = filteredDestinations[indexPath.row]
//        tableView.isHidden = true
//        searchBar.resignFirstResponder()
//    }
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
    
    
}
