//
//  signInVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//

import UIKit

class signInVC: UIViewController {

    private let cardView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()

    private let forgotPasswordButton = UIButton(type: .system)
    private let signInButton = UIButton(type: .system)
    private let signUpPrompt = UILabel()
    private let signUpButton = UIButton(type: .system)

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
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        updateLocalizedText()
    }

    private func displayName(for code: String) -> String {
        switch code {
        case "en": return "English ˅"
        case "ar": return "العربية ˅"
        default: return "Language ˅"
        }
    }

    private func updateLocalizedText() {
        navigationItem.rightBarButtonItem?.title = displayName(for: currentLanguage)
        titleLabel.text = "Let’s Travel you in."
        subtitleLabel.text = "Discover the World with Every Sign In"
        emailTextField.placeholder = "Email or Phone Number"
        passwordTextField.placeholder = "Password"
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        signInButton.setTitle("Sign In", for: .normal)
        signUpPrompt.text = "I don’t have an account?"
        signUpButton.setTitle("Sign Up", for: .normal)
    }

    @objc func showLanguageSelector() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let languages = [("en", "English"), ("ar", "العربية")]

        for (code, name) in languages {
            alert.addAction(UIAlertAction(title: name, style: .default, handler: { _ in
                self.currentLanguage = code
                self.updateLocalizedText()
            }))
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }

    private func setupUI() {
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "Background")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(backgroundImageView, at: 0)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: displayName(for: currentLanguage),
            style: .plain,
            target: self,
            action: #selector(showLanguageSelector)
        )
        navigationItem.rightBarButtonItem?.tintColor = .white

        
        let googleButton = makeSocialButton(imageName: "google", url: "https://accounts.google.com/")
        let appleButton = makeSocialButton(imageName: "apple", url: "https://appleid.apple.com/")
        let facebookButton = makeSocialButton(imageName: "facebook", url: "https://facebook.com/")

        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 24
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)

        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])

        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.textColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

        emailTextField.borderStyle = .roundedRect
        emailTextField.autocapitalizationType = .none
        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        forgotPasswordButton.setTitleColor(.systemGray, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.contentHorizontalAlignment = .right
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signInButton.layer.cornerRadius = 22
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false

        let socialStack = UIStackView()
        socialStack.axis = .horizontal
        socialStack.spacing = 16
        socialStack.distribution = .fillEqually
        socialStack.translatesAutoresizingMaskIntoConstraints = false
        socialStack.addArrangedSubview(googleButton)
        socialStack.addArrangedSubview(appleButton)
        socialStack.addArrangedSubview(facebookButton)

        
        signUpPrompt.font = UIFont.systemFont(ofSize: 14)
        signUpPrompt.textAlignment = .center
        signUpPrompt.translatesAutoresizingMaskIntoConstraints = false

        signUpButton.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 22
        signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        
        [titleLabel, subtitleLabel, emailTextField, passwordTextField,
         forgotPasswordButton, signInButton, socialStack,
         signUpPrompt, signUpButton].forEach { cardView.addSubview($0) }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            emailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 24),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),

            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),

            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 16),
            signInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 44),

            socialStack.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 24),
            socialStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 32),
            socialStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -32),
            socialStack.heightAnchor.constraint(equalToConstant: 48),

            signUpPrompt.topAnchor.constraint(equalTo: socialStack.bottomAnchor, constant: 24),
            signUpPrompt.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),

            signUpButton.topAnchor.constraint(equalTo: signUpPrompt.bottomAnchor, constant: 8),
            signUpButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 40),
            signUpButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -40),
            signUpButton.heightAnchor.constraint(equalToConstant: 44),
            signUpButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
    }

    private func makeSocialButton(imageName: String, url: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.imageView?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.addAction(UIAction(handler: { _ in
            if let link = URL(string: url) {
                UIApplication.shared.open(link)
            }
        }), for: .touchUpInside)
        return button
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }

    private func applyErrorStyle(to textField: UITextField, message: String?) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        if let message = message {
            print("⚠️ Validation error: \(message)")
        }
    }

    private func resetStyle(for textField: UITextField) {
        textField.layer.borderWidth = 0
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func handleSignIn() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        var hasError = false

        resetStyle(for: emailTextField)
        resetStyle(for: passwordTextField)

        if !isValidEmail(email) {
            applyErrorStyle(to: emailTextField, message: "Invalid email format.")
            hasError = true
        }

        if !isValidPassword(password) {
            applyErrorStyle(to: passwordTextField, message: "Password must be at least 6 characters.")
            hasError = true
        }

        if hasError {
            showAlert(title: "Login Failed", message: "Please correct the highlighted fields.")
            return
        }

        loginUser(email: email, password: password)
        
    }

    private func loginUser(email: String, password: String) {
        guard let url = URL(string: "http://51.15.250.187:8006/api/method/login") else {
            showAlert(title: "Error", message: "Invalid login URL.")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody: [String: String] = [
            "usr": email,
            "pwd": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            showAlert(title: "Error", message: "Failed to encode credentials.")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.showAlert(title: "Login Failed", message: error.localizedDescription)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    self.showAlert(title: "Login Failed", message: "No response from server.")
                    return
                }

                if httpResponse.statusCode == 200 {
                    
                    self.showAlert(title: "Success", message: "Logged in successfully!")
                    // TODO: Navigate to HomeVC
//                    let nextVC = homeVC()
//                        nextVC.user = email
//                        self.navigationController?.pushViewController(nextVC, animated: true)
                    let tabBar = TabBarBuilder.createTabBarController()
                    tabBar.modalPresentationStyle = .fullScreen
                    self.present(tabBar, animated: true, completion: nil)

                } else {
                    
                    if let data = data,
                       let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let message = json["message"] as? String {
                        self.showAlert(title: "Login Failed", message: message)
                    } else {
                        self.showAlert(title: "Login Failed", message: "Invalid credentials or server error.")
                    }
                }
            }
        }

        task.resume()
    }

    @objc private func buttonTapped (){
        let tabBar = TabBarBuilder.createTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true, completion: nil)
    }
}
