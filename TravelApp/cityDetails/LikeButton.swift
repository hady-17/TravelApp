//
//  File.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class LikeButton: UIButton {
    var isLiked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        setImage(UIImage(systemName: "heart", withConfiguration: config), for: .normal)
        tintColor = .red
        backgroundColor = .white
        layer.cornerRadius = 25
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        clipsToBounds = false
        addTarget(self, action: #selector(toggleLike), for: .touchUpInside)
    }
    
    @objc func toggleLike() {
        isLiked.toggle()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let imageName = isLiked ? "heart.fill" : "heart"
        setImage(UIImage(systemName: imageName, withConfiguration: config), for: .normal)
    }
}
