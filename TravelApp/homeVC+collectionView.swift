//
//  homeVC+collectionView.swift
//  TravelApp
//
//  Created by hady ka on 01/05/2025.
//

import Foundation
import UIKit
extension homeVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.cityData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as! citiesCell
        if let data = vm.getDataInRow(indexPath.row){
            cell.setUpData(data: data)
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}
