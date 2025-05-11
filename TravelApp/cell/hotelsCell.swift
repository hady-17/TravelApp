//
//  hotelsCell.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class hotelsCell: UICollectionViewCell {

    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    {
        didSet{
            hotelImage.image = UIImage(systemName: "house")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpData(data:DataItem){
        hotelName.text = data.title
        
    }
}
