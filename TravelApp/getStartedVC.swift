//
//  getStartedVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class getStartedVC: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var journeyButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    private func setupUI() {
        
        backgroundImageView.alpha = 0
        logoImageView.alpha = 0
        cardView.alpha = 0
        cardView.transform = CGAffineTransform(translationX: 0, y: 100)

        
        backgroundImageView.image = UIImage(named: "getStartedBackground")
        logoImageView.image = UIImage(named: "travelinLogo")

        
        journeyButton.setTitle("Your Journey Starts Here", for: .normal)
        journeyButton.layer.cornerRadius = 12
        journeyButton.clipsToBounds = true
        journeyButton.addTarget(self, action: #selector(journeyButtonTapped), for: .touchUpInside)

        
        animateUI()
        animateButtonPulse()
    }

    
    private func animateUI() {
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundImageView.alpha = 1
        })

        
        UIView.animate(withDuration: 1.0, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.logoImageView.transform = .identity
            }
        })

        
        UIView.animate(withDuration: 1.0, delay: 0.6, options: .curveEaseOut, animations: {
            self.cardView.alpha = 1
            self.cardView.transform = .identity
        })
    }

    private func animateButtonPulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.0
        pulse.toValue = 1.05
        pulse.duration = 0.6
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0

        journeyButton.layer.add(pulse, forKey: "pulse")
    }

    
    @objc private func journeyButtonTapped() {
        let signInVC = signInVC(nibName: "signInVC", bundle: nil)
        navigationController?.pushViewController(signInVC, animated: true)
    }
}
