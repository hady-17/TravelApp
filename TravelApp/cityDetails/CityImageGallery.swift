//
//  CityImageGallery.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class CityImageGallery: UIView {
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with imageNames: [String]) {
        // Clear existing views
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for i in 0..<4 {
            let imgView = UIImageView()
            imgView.image = UIImage(named: "user")
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
            imgView.layer.cornerRadius = 12
            imgView.widthAnchor.constraint(equalToConstant: 68).isActive = true
            imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(imgView)
        }
    }
}
