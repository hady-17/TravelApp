//
//  homeModelView.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import Foundation

class viewModel {
    var resp : [ApiResponse]?
     var cityData: [DataItem]?
    var didGetError: ((String) -> Void)?
    var didGetData: ((String) -> Void)?
    var onResultsUpdated:(()->Void)?
    
    func fetchData() {
        print("fetch....")
        guard let url = URL(string: "https://fakerapi.it/api/v2/images") else {
            didGetError?("Invalid URL")
            return
        }
        
        print("\(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error {
                self.didGetError?(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.didGetError?("Server returned an error")
                return
            }
            
            guard let data = data else {
                self.didGetError?("No data received")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                //print("\(decodedResponse)")
                self.cityData = decodedResponse.data
                self.didGetData?("Successful fetching")
            } catch {
                self.didGetError?(error.localizedDescription)
            }
        }
        task.resume()
    }
    
//    func numberOfItemsInSection() -> Int {
//        return countryData?.count ?? 0
//    }
//    
    func getDataInRow(_ index: Int) -> DataItem? {
        guard let Data = cityData, index >= 0 && index < Data.count else {
            return nil
        }
        return Data[index]
    }
    
    var filteredDestinations: [DataItem] = []
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchTableView.isHidden = false
//        filteredDestinations = allDestinations
//        searchTableView.reloadData()
//    }
    func filterDestinations(with query: String) {
        if query.isEmpty {
            if let data = cityData {
                filteredDestinations = data
            }
            
        } else {
            if let data = cityData {
                filteredDestinations = data.filter {
                    $0.title!.lowercased().contains(query.lowercased())
                }
            }
            
        }
        onResultsUpdated?()
    }


    
}
