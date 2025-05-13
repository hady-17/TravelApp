import UIKit

class DescriptionView: UIView {
    private let descriptionLabel = UILabel()
    private let reviewLabel = UILabel()
    private let detailedDescriptionLabel = UILabel()
    private let reviewTextView = UILabel()
    private let readMoreButton = UIButton(type: .system)
    
    private var isExpanded = false
    private var fullDescriptionText = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // Title Row
        let titleRow = UIStackView()
        titleRow.axis = .horizontal
        titleRow.distribution = .equalSpacing
        titleRow.isUserInteractionEnabled = true
        
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        descriptionLabel.textColor = .black
        descriptionLabel.isUserInteractionEnabled = true
        let descTap = UITapGestureRecognizer(target: self, action: #selector(showDescription))
        descriptionLabel.addGestureRecognizer(descTap)

        reviewLabel.text = "Review"
        reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        reviewLabel.textColor = .gray
        reviewLabel.isUserInteractionEnabled = true
        let reviewTap = UITapGestureRecognizer(target: self, action: #selector(showReview))
        reviewLabel.addGestureRecognizer(reviewTap)

        titleRow.addArrangedSubview(descriptionLabel)
        titleRow.addArrangedSubview(reviewLabel)

        // Detailed Description Label
        detailedDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        detailedDescriptionLabel.textColor = .black
        detailedDescriptionLabel.numberOfLines = 4
        detailedDescriptionLabel.lineBreakMode = .byTruncatingTail

        // Review Text View
        reviewTextView.font = UIFont.systemFont(ofSize: 16)
        reviewTextView.textColor = .black
        reviewTextView.isHidden = true
        reviewTextView.numberOfLines = 0
                

        // Read More Button
        readMoreButton.setTitle("Read more", for: .normal)
        readMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        readMoreButton.tintColor = .systemBlue
        readMoreButton.addTarget(self, action: #selector(toggleReadMore), for: .touchUpInside)

        // Add views to stack
        stackView.addArrangedSubview(titleRow)
        stackView.addArrangedSubview(detailedDescriptionLabel)
        stackView.addArrangedSubview(reviewTextView)
        stackView.addArrangedSubview(readMoreButton)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            reviewLabel.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 15)
        ])
    }

    func configure(description: String, review: String) {
        fullDescriptionText = description
        detailedDescriptionLabel.text = description
        reviewTextView.text = review
    }

    @objc private func toggleReadMore() {
        isExpanded.toggle()

        UIView.animate(withDuration: 0.3) {
            self.detailedDescriptionLabel.numberOfLines = self.isExpanded ? 0 : 3
            self.readMoreButton.setTitle(self.isExpanded ? "Read less" : "Read more", for: .normal)
            self.layoutIfNeeded()
        }
    }

    @objc private func showDescription() {
        detailedDescriptionLabel.isHidden = false
        readMoreButton.isHidden = false
        reviewTextView.isHidden = true
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        descriptionLabel.textColor = .black
        reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        reviewLabel.textColor = .gray
    }

    @objc private func showReview() {
        detailedDescriptionLabel.isHidden = true
        readMoreButton.isHidden = true
        reviewTextView.isHidden = false 
        
        reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        reviewLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.textColor = .gray
        self.layoutIfNeeded()
    }

}
