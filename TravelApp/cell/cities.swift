//
//  cities.swift
//  TravelApp
//
//  Created by hady ka on 12/05/2025.
//

import UIKit

class cities: UIViewController {
    var CitiesData:[DataItem]? = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backPressed(_ sender: UIButton) {
    }
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            let cell = UINib(nibName: "citiesCell", bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: "cityCell")
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension cities : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
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
        CitiesData?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as! citiesCell
        if let data = getDataInRow(indexPath.row){
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 185, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func getDataInRow(_ index: Int) -> DataItem? {
        guard let Data = CitiesData, index >= 0 && index < Data.count else {
            return nil
        }
        return Data[index]
    }
    
}




