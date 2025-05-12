//
//  BookNowButton.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class BookNowButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setTitle("Book Now", for: .normal)
        backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 25
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
