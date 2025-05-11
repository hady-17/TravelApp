import UIKit
import Localize_Swift

class getStartedVC: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var exploreLabel: UILabel!
    @IBOutlet weak var journeyButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    private func setupUI() {
        
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill

        
        logoImageView.image = UIImage(named: "travelin_logo")
        logoImageView.contentMode = .scaleAspectFit

        
        cardView.layer.cornerRadius = 24
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.shadowRadius = 10

        
        exploreLabel.text = "Ready to explore beyond boundaries?".localized()
        exploreLabel.textAlignment = .center
        exploreLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        exploreLabel.textColor = .darkText

        
        journeyButton.setTitle("Your Journey Starts Here ✈️".localized(), for: .normal)
        journeyButton.backgroundColor = UIColor.systemTeal
        journeyButton.setTitleColor(.white, for: .normal)
        journeyButton.layer.cornerRadius = 12
        journeyButton.addTarget(self, action: #selector(journeyButtonTapped), for: .touchUpInside)

        
        languageButton.setTitle("English ⌄", for: .normal)
        languageButton.setTitleColor(.white, for: .normal)
        languageButton.addTarget(self, action: #selector(showLanguageOptions), for: .touchUpInside)

        
        animateEntrance()
    }

   
    @objc private func journeyButtonTapped() {
        let signInVC = signInVC(nibName: "signInVC", bundle: nil)
        navigationController?.pushViewController(signInVC, animated: true)
    }

    @objc private func showLanguageOptions() {
        let alert = UIAlertController(title: "Choose Language", message: nil, preferredStyle: .actionSheet)
        let languages = ["en": "English", "fr": "Français", "ar": "العربية"]

        for (code, name) in languages {
            alert.addAction(UIAlertAction(title: name, style: .default, handler: { _ in
                Localize.setCurrentLanguage(code)
                self.setupUI() // refresh labels
            }))
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    
    private func animateEntrance() {
        cardView.alpha = 0
        cardView.transform = CGAffineTransform(translationX: 0, y: 50)

        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.curveEaseOut], animations: {
            self.cardView.alpha = 1
            self.cardView.transform = .identity
        }, completion: nil)
    }
}
