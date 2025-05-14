//
//  CityHeaderView.swift
//  TravelApp
//
//  Created by hady ka on 11/05/2025.
//

import UIKit

class CityHeaderView: UIView {
    let backgroundImageView = UIImageView()
    let overlayView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        // Background image
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        addSubview(backgroundImageView)
        
        // Overlay
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        backgroundImageView.addSubview(overlayView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: -70),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            overlayView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor)
        ])
    }
    
    func configure(with imageName: String) {
//        backgroundImageView.image = UIImage(named: imageName)
        let image = backgroundImageView.image
        
        loadImage(from: imageName)
    }
    
                  private func loadImage(from urlString: String) {
                      guard let url = URL(string: urlString) else {
                          print("❌ Invalid URL: \(urlString)")
                          return
                      }

                      URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                          if let error = error {
                              print("❌ Image load error: \(error.localizedDescription)")
                              return
                          }

                          guard let data = data, let image = UIImage(data: data) else {
                              print("❌ Could not decode image data.")
                              return
                          }

                          DispatchQueue.main.async {
                              self?.backgroundImageView.image = image
                          }
                      }.resume()
                  }


}
