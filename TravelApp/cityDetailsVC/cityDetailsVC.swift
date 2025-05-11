//
//  cityDetailsVC.swift
//  TravelApp
//
//  Created by hady ka on 30/04/2025.
//
import UIKit

class cityDetailsVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var cityTitle = "Bali"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        likeButton.addTarget(self, action: #selector(toggleLike), for: .touchUpInside)
        setupScrollView()
        setupContent()
    }

    var isLiked = false

    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        button.setImage(UIImage(systemName: "heart", withConfiguration: config), for: .normal)
        button.tintColor = .red
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.clipsToBounds = false
        return button
    }()

    @objc func toggleLike() {
        isLiked.toggle()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let imageName = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName, withConfiguration: config), for: .normal)
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    func setupContent() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        addContent()
    }

    
    func addContent() {
        // Background image
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "Bali")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        contentView.addSubview(backgroundImageView)

        // Black overlay
        let overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        backgroundImageView.addSubview(overlayView)

        // City details card
        let cityDetailsCard = UIView()
        cityDetailsCard.translatesAutoresizingMaskIntoConstraints = false
        cityDetailsCard.backgroundColor = .white
        cityDetailsCard.layer.cornerRadius = 40
        cityDetailsCard.layer.masksToBounds = false
        contentView.addSubview(cityDetailsCard)
    
        // Like Button
        
       contentView.addSubview(likeButton)
       contentView.bringSubviewToFront(likeButton)
        // White container for image stack (312px width, 66px height, 20px corner radius)
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .white
        imageContainer.layer.cornerRadius = 20
        imageContainer.layer.shadowColor = UIColor.gray.cgColor
        imageContainer.layer.shadowOpacity = 0.7
        imageContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageContainer.layer.shadowRadius = 6
        imageContainer.layer.masksToBounds = false
        cityDetailsCard.addSubview(imageContainer)

        // Horizontal image stack
        let imageStack = UIStackView()
        imageStack.axis = .horizontal
        imageStack.spacing = 8 // Gap between images
        imageStack.translatesAutoresizingMaskIntoConstraints = false
        imageStack.distribution = .fillEqually
        imageStack.alignment = .fill
        imageContainer.addSubview(imageStack)

        // Add 4 rounded images
        let imageNames = ["Bali", "Bali", "Bali", "Bali"]
        for name in imageNames {
            let imgView = UIImageView()
            imgView.image = UIImage(named: name)
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
            imgView.layer.cornerRadius = 12 // Corner radius for images
            imgView.widthAnchor.constraint(equalToConstant: 68).isActive = true
            imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            imageStack.addArrangedSubview(imgView)
        }

        //title and price row
        let titlePriceStack = UIStackView()
        titlePriceStack.axis = .horizontal
        titlePriceStack.distribution = .equalSpacing
        titlePriceStack.alignment = .center
        titlePriceStack.translatesAutoresizingMaskIntoConstraints = false

        // title label on the left side
        let titleLabel = UILabel()
        titleLabel.text = "Bali"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        // price label on the right side
        let priceLabel = UILabel()
        let priceText = NSMutableAttributedString(string: "$120.50 ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)])
        priceText.append(NSAttributedString(string: "/person", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)]))
        priceLabel.attributedText = priceText
        
        // combinning labels into one row
        titlePriceStack.addArrangedSubview(titleLabel)
        titlePriceStack.addArrangedSubview(priceLabel)
        cityDetailsCard.addSubview(titlePriceStack)
       

        // Location and Rating Row
        let infoStack = UIStackView()
        infoStack.axis = .horizontal
        infoStack.distribution = .equalSpacing
        infoStack.alignment = .center
        infoStack.translatesAutoresizingMaskIntoConstraints = false

        // Location stack (icon + label)
        let locationStack = UIStackView()
        locationStack.axis = .horizontal
        locationStack.spacing = 4
        locationStack.alignment = .center

        let locationIcon = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        locationIcon.tintColor = .gray
        locationIcon.contentMode = .scaleAspectFit
        locationIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true

        let locationLabel = UILabel()
        locationLabel.text = "Indonesia"
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = .gray

        // Combinning icon and location label
        locationStack.addArrangedSubview(locationIcon)
        locationStack.addArrangedSubview(locationLabel)

        // Rating stack (star + score)
        let ratingStack = UIStackView()
        ratingStack.axis = .horizontal
        ratingStack.spacing = 4
        ratingStack.alignment = .center

        let starIcon = UIImageView(image: UIImage(systemName: "star.fill"))
        starIcon.tintColor = .systemYellow
        starIcon.contentMode = .scaleAspectFit
        starIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        starIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true

        let ratingLabel = UILabel()
        ratingLabel.text = "4.7"
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
        ratingLabel.textColor = .gray

        // Combinning star and rating label
        ratingStack.addArrangedSubview(starIcon)
        ratingStack.addArrangedSubview(ratingLabel)

        // Add to main info row
        infoStack.addArrangedSubview(locationStack)
        infoStack.addArrangedSubview(ratingStack)
        cityDetailsCard.addSubview(infoStack)
        
        // Overlapping Avatars Stack
        let avatarsStack = UIStackView()
        avatarsStack.axis = .horizontal
        avatarsStack.spacing = -12  // Negative spacing for overlap
        avatarsStack.translatesAutoresizingMaskIntoConstraints = false
        cityDetailsCard.addSubview(avatarsStack)

        let avatarNames = ["Bali", "Bali", "Bali"] // Replace with your asset names

        for name in avatarNames {
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
            avatarsStack.addArrangedSubview(imageView)
        }

        // Last Circle with "4+"
        let lastView = UIView()
        lastView.translatesAutoresizingMaskIntoConstraints = false
        lastView.layer.cornerRadius = 24
        lastView.clipsToBounds = true
        lastView.layer.borderWidth = 2
        lastView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        lastView.layer.borderColor = UIColor.white.cgColor

        let lastImage = UIImageView(image: UIImage(named: "Bali")) // Any photo
        lastImage.translatesAutoresizingMaskIntoConstraints = false
        lastImage.contentMode = .scaleAspectFill
        lastImage.alpha = 0.5
        lastImage.clipsToBounds = true
        lastView.addSubview(lastImage)

        let overlayLabel = UILabel()
        overlayLabel.text = "4+"
        overlayLabel.font = UIFont.boldSystemFont(ofSize: 14)
        overlayLabel.textColor = .white
        overlayLabel.textAlignment = .center
        overlayLabel.translatesAutoresizingMaskIntoConstraints = false
        lastView.addSubview(overlayLabel)

        // Add to stack
        avatarsStack.addArrangedSubview(lastView)

        // Description stack
        let descriptionStack = UIStackView()
        descriptionStack.axis = .horizontal
        descriptionStack.distribution = .equalSpacing
        descriptionStack.alignment = .center
        descriptionStack.translatesAutoresizingMaskIntoConstraints = false

        // Description label on the left side
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        // Review label on the right side
        let reviewLabel = UILabel()
        reviewLabel.text = "Review"
        reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        reviewLabel.textColor = .gray
        
        descriptionStack.addArrangedSubview(descriptionLabel)
        descriptionStack.addArrangedSubview(reviewLabel)
        cityDetailsCard.addSubview(descriptionStack)
        
        // Description Label
        let detailedDescriptionLabel = UILabel()
        detailedDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailedDescriptionLabel.text = "This is a description of the city. You can add more detailed text here to explain the city in full detail. It can be multiple lines of text, and we'll make sure it's displayed properly in the scroll view."
        detailedDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        detailedDescriptionLabel.numberOfLines = 0 // Allow the text to wrap and show multiple lines
        detailedDescriptionLabel.textColor = .black
        cityDetailsCard.addSubview(detailedDescriptionLabel)
        
        let bookNowButton = UIButton()
        bookNowButton.translatesAutoresizingMaskIntoConstraints = false
        bookNowButton.setTitle("Book Now", for: .normal)
        bookNowButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 188/255, alpha: 1)
        bookNowButton.setTitleColor(.white, for: .normal)
        bookNowButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        bookNowButton.layer.cornerRadius = 30
        cityDetailsCard.addSubview(bookNowButton)
        
        NSLayoutConstraint.activate([
            detailedDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            detailedDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailedDescriptionLabel.topAnchor.constraint(equalTo: descriptionStack.topAnchor, constant: 20),
            
            bookNowButton.heightAnchor.constraint(equalToConstant: 50),
                       bookNowButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                       bookNowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                       bookNowButton.bottomAnchor.constraint(equalTo: cityDetailsCard.safeAreaLayoutGuide.bottomAnchor, constant: -10)
                ])
        NSLayoutConstraint.activate([
            
            // Constraints for backgroundImageView
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        
            // City details card overlap
            cityDetailsCard.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -100),
            cityDetailsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cityDetailsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cityDetailsCard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            // Overlay covers the entire image
            overlayView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            
            // Like Button
            likeButton.widthAnchor.constraint(equalToConstant: 50),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.centerYAnchor.constraint(equalTo: cityDetailsCard.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            
            // Image container inside cityDetailsCard
            imageContainer.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 20),
            imageContainer.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 30),
            imageContainer.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -30),
            imageContainer.heightAnchor.constraint(equalToConstant: 66),
            imageContainer.widthAnchor.constraint(equalToConstant: 312),

            // Image stack inside container
            imageStack.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 8),
            imageStack.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 8),
            imageStack.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -8),
            imageStack.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -8),
            
            // Title price container position
            titlePriceStack.topAnchor.constraint(equalTo: imageStack.bottomAnchor, constant: 20),
            titlePriceStack.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),
            titlePriceStack.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            
            // Information container position
            infoStack.topAnchor.constraint(equalTo: titlePriceStack.bottomAnchor, constant: 12),
            infoStack.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),
            infoStack.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            
            // Avatars stack position
            lastView.widthAnchor.constraint(equalToConstant: 48),
            lastView.heightAnchor.constraint(equalToConstant: 48),
            
            lastImage.topAnchor.constraint(equalTo: lastView.topAnchor),
            lastImage.bottomAnchor.constraint(equalTo: lastView.bottomAnchor),
            lastImage.leadingAnchor.constraint(equalTo: lastView.leadingAnchor),
            lastImage.trailingAnchor.constraint(equalTo: lastView.trailingAnchor),
            
            overlayLabel.centerXAnchor.constraint(equalTo: lastView.centerXAnchor),
            overlayLabel.centerYAnchor.constraint(equalTo: lastView.centerYAnchor),
            
            avatarsStack.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 16),
            avatarsStack.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),

            // Description / Review row position
            descriptionStack.topAnchor.constraint(equalTo: avatarsStack.bottomAnchor, constant: 20),
            descriptionStack.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),
            descriptionStack.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            reviewLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 120),
        ])

    }

}
