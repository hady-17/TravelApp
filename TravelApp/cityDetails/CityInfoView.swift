//
//  CityInfoView.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class CityInfoView: UIView {
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let locationStack = UIStackView()
    let ratingStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        // Title label
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        // Price label
        let priceText = NSMutableAttributedString(string: "$120.50 ", attributes: [
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            .foregroundColor: UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        ])
        priceText.append(NSAttributedString(string: "/person", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        ]))
        priceLabel.attributedText = priceText
        
        // Location stack
        let locationIcon = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        locationIcon.tintColor = .gray
        locationIcon.contentMode = .scaleAspectFit
        
        let locationLabel = UILabel()
        locationLabel.text = "Indonesia"
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = .gray
        
        locationStack.axis = .horizontal
        locationStack.spacing = 4
        locationStack.addArrangedSubview(locationIcon)
        locationStack.addArrangedSubview(locationLabel)
        
        // Rating stack
        let starIcon = UIImageView(image: UIImage(systemName: "star.fill"))
        starIcon.tintColor = .systemYellow
        starIcon.contentMode = .scaleAspectFit
        
        let ratingLabel = UILabel()
        ratingLabel.text = "4.7"
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .gray
        
        ratingStack.axis = .horizontal
        ratingStack.spacing = 4
        ratingStack.addArrangedSubview(starIcon)
        ratingStack.addArrangedSubview(ratingLabel)
        
        // Main stack
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.spacing = 12
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        let titlePriceStack = UIStackView(arrangedSubviews: [titleLabel, priceLabel])
        titlePriceStack.axis = .horizontal
        titlePriceStack.distribution = .equalSpacing
        
        let infoStack = UIStackView(arrangedSubviews: [locationStack, ratingStack])
        infoStack.axis = .horizontal
        infoStack.distribution = .equalSpacing
        
        mainStack.addArrangedSubview(titlePriceStack)
        mainStack.addArrangedSubview(infoStack)
        
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            locationIcon.widthAnchor.constraint(equalToConstant: 16),
            locationIcon.heightAnchor.constraint(equalToConstant: 16),
            starIcon.widthAnchor.constraint(equalToConstant: 16),
            starIcon.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func configure(title: String, price: String, location: String, rating: String) {
        titleLabel.text = title
        
        let priceText = NSMutableAttributedString(string: "\(price) ", attributes: [
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            .foregroundColor: UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        ])
        priceText.append(NSAttributedString(string: "/person", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        ]))
        priceLabel.attributedText = priceText
        
        if let locationLabel = locationStack.arrangedSubviews[1] as? UILabel {
            locationLabel.text = location
        }
        
        if let ratingLabel = ratingStack.arrangedSubviews[1] as? UILabel {
            ratingLabel.text = rating
        }
    }
}
