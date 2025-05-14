import UIKit

class CityDetailsVC: UIViewController {
    var Data : DataItem?
    let scrollView = UIScrollView()
    let contentView = UIView()
    var cityTitle = "Bali"
    
    private let cityHeaderView = CityHeaderView()
    private let likeButton = LikeButton()
    private let cityDetailsCard = UIView()
    private let cityImageGallery = CityImageGallery()
    private let cityInfoView = CityInfoView()
    private let visitorsView = VisitorsView()
    private let descriptionView = DescriptionView()
    private let bookNowButton = BookNowButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        setupLayout()
        configureViews()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupLayout() {
        // Add views to contentView
        contentView.addSubview(cityHeaderView)
        contentView.addSubview(cityDetailsCard)
        
        // Add detail subviews to the card
        cityDetailsCard.addSubview(cityImageGallery)
        cityDetailsCard.addSubview(cityInfoView)
        cityDetailsCard.addSubview(visitorsView)
        cityDetailsCard.addSubview(descriptionView)
        cityDetailsCard.addSubview(bookNowButton)
        contentView.addSubview(likeButton)
        
        // Disable autoresizing masks
        [cityHeaderView, likeButton, cityDetailsCard,
         cityImageGallery, cityInfoView, visitorsView,
         descriptionView, bookNowButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Style cityDetailsCard
        cityDetailsCard.backgroundColor = .white
        cityDetailsCard.layer.cornerRadius = 40
        cityDetailsCard.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            // Header
            cityHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            // Like Button
            likeButton.widthAnchor.constraint(equalToConstant: 50),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.centerYAnchor.constraint(equalTo: cityHeaderView.bottomAnchor, constant: -130),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Details Card
            cityDetailsCard.topAnchor.constraint(equalTo: cityHeaderView.bottomAnchor, constant: -130),
            cityDetailsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityDetailsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityDetailsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Image Gallery
            cityImageGallery.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 20),
            cityImageGallery.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 30),
            cityImageGallery.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -30),
            cityImageGallery.heightAnchor.constraint(equalToConstant: 66),
            
            // Info View
            cityInfoView.topAnchor.constraint(equalTo: cityImageGallery.bottomAnchor, constant: 20),
            cityInfoView.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),
            cityInfoView.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            
            // Visitors View
            visitorsView.topAnchor.constraint(equalTo: cityInfoView.bottomAnchor, constant: 16),
            visitorsView.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),
            visitorsView.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            visitorsView.heightAnchor.constraint(equalToConstant: 48),
            
            // Description View
            descriptionView.topAnchor.constraint(equalTo: visitorsView.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 20),
            descriptionView.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -20),
            
            // Book Now Button
            bookNowButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 30),
            bookNowButton.centerXAnchor.constraint(equalTo: cityDetailsCard.centerXAnchor),
            bookNowButton.leadingAnchor.constraint(equalTo: cityDetailsCard.leadingAnchor, constant: 40),
            bookNowButton.trailingAnchor.constraint(equalTo: cityDetailsCard.trailingAnchor, constant: -40),
            bookNowButton.bottomAnchor.constraint(equalTo: cityDetailsCard.bottomAnchor, constant: -30)
        ])
    }
    
    func configureViews() {
        cityHeaderView.configure(with: Data?.title ?? "user")
        cityImageGallery.configure(with: [Data?.url ?? ""])
        cityInfoView.configure(title: Data?.title ?? "Bali", price: "120.50", location: "Indonesia", rating: "4.7")
        visitorsView.configure(with:["user1","user2","user3","user"	], extraCount: 4)
        descriptionView.configure(description: Data?.description ?? "Great Place", review: "Excellent choice for travelers.")
    }
    
    
}
