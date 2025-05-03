//
//  ViewController.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class ViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#007A8C")
        setupLogo()
        animateLogo()
    }
    
    private func setupLogo(){
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func animateLogo() {
            logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            logoImageView.alpha = 0

            UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: [], animations: {
                self.logoImageView.alpha = 1
                self.logoImageView.transform = .identity
            }) { _ in
                UIView.animate(withDuration: 0.8, delay: 0.5, options: .curveEaseInOut, animations: {
                    self.logoImageView.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
                    self.logoImageView.alpha = 0
                }) { _ in
                    self.goToGetStarted()
                }
            }
        }
    
    private func goToGetStarted() {
        let getStartedVC = getStartedVC(nibName: "getStartedVC", bundle: nil)
        let navController = UINavigationController(rootViewController: getStartedVC)

        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navController
            window.makeKeyAndVisible()
        }
    }

    
}
extension UIColor {
    convenience init(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }

        var rgb: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255
        let b = CGFloat(rgb & 0x0000FF) / 255

        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}

