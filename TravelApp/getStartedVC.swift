import UIKit

class getStartedVC: UIViewController {

    let cardView = UIView()
    let titleLabel = UILabel()
    let startButton = UIButton(type: .system)
    

    private let languageKey = "selectedLanguage"
       private var currentLanguage: String {
           get {
               return UserDefaults.standard.string(forKey: languageKey) ?? "en"
           }
           set {
               UserDefaults.standard.set(newValue, forKey: languageKey)
               UserDefaults.standard.synchronize()
           }
       }

       override func viewDidLoad() {
           super.viewDidLoad()
           setupUI()

               navigationItem.rightBarButtonItem = UIBarButtonItem(
               title: displayName(for: currentLanguage),
               style: .plain,
               target: self,
               action: #selector(showLanguageSelector)
           )
           navigationController?.setNavigationBarHidden(false, animated: false)
           navigationItem.rightBarButtonItem?.tintColor = .white
           updateLocalizedText()
       }

    private func displayName(for code: String) -> String {
        switch code {
        case "en": return "English ˅"
        case "ar": return "العربية ˅"
        default: return "Language ˅"
        }
    }


       @objc func navigateToSignIn() {
           let signInVC = signInVC()
           navigationController?.pushViewController(signInVC, animated: true)
       }

       @objc func showLanguageSelector() {
           let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

           let languages = [
               ("en", "English"),
               ("ar", "العربية")
           ]

           for (code, name) in languages {
               let action = UIAlertAction(title: name, style: .default) { _ in
                   self.currentLanguage = code
                   self.updateLocalizedText()
               }
               alert.addAction(action)
           }

           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

           if let popover = alert.popoverPresentationController {
               popover.barButtonItem = navigationItem.rightBarButtonItem
           }

           present(alert, animated: true)
       }


    private func updateLocalizedText() {
        navigationItem.rightBarButtonItem?.title = displayName(for: currentLanguage)
        titleLabel.text = "Ready to explore beyond boundaries?"
        startButton.setTitle("Your Journey Starts Here ", for: .normal)
    }

    private func localized(_ key: String) -> String {
        guard let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return key
        }
        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
    }

    private func setupUI() {
        
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "Background")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(backgroundImageView, at: 0)

        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 25
        cardView.layer.masksToBounds = true
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)

        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])

       
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        titleLabel.textColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(titleLabel)

        
        startButton.layer.cornerRadius = 22
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        startButton.addTarget(self, action: #selector(navigateToSignIn), for: .touchUpInside)

        
        startButton.titleLabel?.numberOfLines = 1
        startButton.titleLabel?.lineBreakMode = .byTruncatingTail
        startButton.setContentHuggingPriority(.required, for: .horizontal)
        startButton.setContentCompressionResistancePriority(.required, for: .horizontal)

       
        let airplaneImage = UIImage(systemName: "airplane")?.withRenderingMode(.alwaysTemplate)
        startButton.setImage(airplaneImage, for: .normal)
        startButton.tintColor = .white
        startButton.semanticContentAttribute = .forceRightToLeft
        startButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        startButton.titleEdgeInsets = .zero

       
        DispatchQueue.main.async {
            self.startButton.imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
        }



        
        if let imageView = startButton.imageView {
            
        }
        startButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        startButton.titleEdgeInsets = UIEdgeInsets.zero

        
        startButton.layer.shadowColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 0.4).cgColor
        startButton.layer.shadowOpacity = 0.6
        startButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        startButton.layer.shadowRadius = 10
        startButton.layer.masksToBounds = false

        cardView.addSubview(startButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),

            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            startButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 40),
            startButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "Logo_GetStarted")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
            logoImageView.widthAnchor.constraint(equalToConstant: 234),
            logoImageView.heightAnchor.constraint(equalToConstant: 98)
        ])
        
    }
}
