//
//  citiesCell.swift
//  TravelApp
//
//  Created by hady ka on 01/05/2025.
//

import UIKit

class citiesCell: UICollectionViewCell {

    @IBOutlet weak var viewContainer: UIView!{
        didSet{
            viewContainer.layer.cornerRadius = 4
            viewContainer.backgroundColor = .darkGray
        }
    }

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpData(data:DataItem){
        cityLabel.text = data.title
        countryLabel.text = "lebanon"
    }

}
