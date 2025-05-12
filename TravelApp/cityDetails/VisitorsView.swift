//
//  VisitorsView.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class VisitorsView: UIView {
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
        stackView.axis = .horizontal
        stackView.spacing = -12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with imageNames: [String], extraCount: Int) {
        // Clear existing views
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for name in imageNames {
            let imageView = UIImageView(image: UIImage(named: name))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 24
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 48),
                imageView.heightAnchor.constraint(equalToConstant: 48)
            ])
            stackView.addArrangedSubview(imageView)
        }
        
        // Add extra count view
        let lastView = UIView()
        lastView.translatesAutoresizingMaskIntoConstraints = false
        lastView.layer.cornerRadius = 24
        lastView.clipsToBounds = true
        lastView.layer.borderWidth = 2
        lastView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        lastView.layer.borderColor = UIColor.white.cgColor
        
        let lastImage = UIImageView(image: UIImage(named: imageNames.first ?? ""))
        lastImage.translatesAutoresizingMaskIntoConstraints = false
        lastImage.contentMode = .scaleAspectFill
        lastImage.alpha = 0.5
        lastImage.clipsToBounds = true
        lastView.addSubview(lastImage)
        
        let overlayLabel = UILabel()
        overlayLabel.text = "\(extraCount)+"
        overlayLabel.font = UIFont.boldSystemFont(ofSize: 14)
        overlayLabel.textColor = .white
        overlayLabel.textAlignment = .center
        overlayLabel.translatesAutoresizingMaskIntoConstraints = false
        lastView.addSubview(overlayLabel)
        
        NSLayoutConstraint.activate([
            lastView.widthAnchor.constraint(equalToConstant: 48),
            lastView.heightAnchor.constraint(equalToConstant: 48),
            
            lastImage.topAnchor.constraint(equalTo: lastView.topAnchor),
            lastImage.bottomAnchor.constraint(equalTo: lastView.bottomAnchor),
            lastImage.leadingAnchor.constraint(equalTo: lastView.leadingAnchor),
            lastImage.trailingAnchor.constraint(equalTo: lastView.trailingAnchor),
            
            overlayLabel.centerXAnchor.constraint(equalTo: lastView.centerXAnchor),
            overlayLabel.centerYAnchor.constraint(equalTo: lastView.centerYAnchor)
        ])
        
        stackView.addArrangedSubview(lastView)
    }
}
