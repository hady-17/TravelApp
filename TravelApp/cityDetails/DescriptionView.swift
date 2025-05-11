import UIKit

class DescriptionView: UIView {
    private let descriptionLabel = UILabel()
    private let reviewLabel = UILabel()
    private let detailedDescriptionLabel = UILabel()
    private let reviewTextView = UITextView()
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
        detailedDescriptionLabel.numberOfLines = 2
        detailedDescriptionLabel.lineBreakMode = .byTruncatingTail

        // Review Text View
        reviewTextView.isEditable = false
        reviewTextView.font = UIFont.systemFont(ofSize: 16)
        reviewTextView.textColor = .black
        reviewTextView.isHidden = true
        reviewTextView.backgroundColor = .lightGray // For debugging visibility

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
        print("Description tapped")
        UIView.animate(withDuration: 0.3) {
            self.detailedDescriptionLabel.isHidden = false
            self.readMoreButton.isHidden = false
            self.reviewTextView.isHidden = true

            self.descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.descriptionLabel.textColor = .black
            self.reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            self.reviewLabel.textColor = .gray
            
            self.layoutIfNeeded()
        }
    }

    @objc private func showReview() {
        print("Review tapped")
        UIView.animate(withDuration: 0.3) {
            self.detailedDescriptionLabel.isHidden = true
            self.readMoreButton.isHidden = true
            self.reviewTextView.isHidden = false

            self.reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.reviewLabel.textColor = .black
            self.descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            self.descriptionLabel.textColor = .gray
            
            self.layoutIfNeeded()
        }
    }
}
