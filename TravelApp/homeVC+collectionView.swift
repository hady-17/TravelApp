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
        if collectionView.tag == 1{
            return vm.cityData?.count ?? 0}
        else{
            return vm.cityData?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as! citiesCell
            if let data = vm.getDataInRow(indexPath.row){
                cell.setUpData(data: data)
                if let urlString = data.url , let url = URL(string: urlString){
                    loadImage(from: url, into: cell.imageView)
                }
            }
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = CGSize(width: 0, height: 4)
            cell.layer.shadowRadius = 6
            cell.layer.masksToBounds = false
            cell.layer.borderColor =  CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            cell.layer.borderWidth = 0.3
            return cell
        }
        else   {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotelsCell", for: indexPath) as! hotelsCell
            if let data = vm.getDataInRow(indexPath.row){
                cell.setUpData(data: data)
                if let urlString = data.url , let url = URL(string: urlString){
                    loadImage(from: url, into: cell.hotelImage)
                }
            }
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = CGSize(width: 0, height: 4)
            cell.layer.shadowRadius = 6
            cell.layer.masksToBounds = false
            cell.layer.borderColor =  CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            cell.layer.borderWidth = 0.3
            return cell
            
        }
//        cell.backgroundColor = .red}
            
//        return cell
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
        let size : CGSize
        if collectionView.tag == 1{
            size = CGSize(width: 150, height: 145)}
        else {
           size = CGSize(width: 380, height: 80)
        }
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            let nextVC = CityDetailsVC()
            nextVC.Data = vm.cityData?[indexPath.row]
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
           // navigationController?.pushViewController(nextVC, animated: true)
            
        }
        else{
            let nextVC = CityDetailsVC()
            nextVC.Data = vm.cityData?[indexPath.row]
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
        }
    }
    
    
}
