//
//  homeVC+collectionView.swift
//  TravelApp
//
//  Created by hady ka on 01/05/2025.
//

import Foundation
import UIKit
extension homeVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func loadImage(from url:URL,into imageView : UIImageView){
        URLSession.shared.dataTask(with: url){
            data,response,error in
            guard let data = data,error==nil else {return}
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.cityData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as! citiesCell
        if let data = vm.getDataInRow(indexPath.row){
            cell.setUpData(data: data)
            if let urlString = data.url , let url = URL(string: urlString){
                loadImage(from: url, into: cell.imageView)
            }
        }
        cell.layer.cornerRadius = 8
//        cell.backgroundColor = .red
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 170)
    }
    
}
