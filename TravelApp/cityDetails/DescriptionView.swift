import UIKit

class DescriptionView: UIView {
    private let descriptionLabel = UILabel()
    private let reviewLabel = UILabel()
    private let detailedDescriptionLabel = UILabel()
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
        
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        reviewLabel.text = "Review"
        reviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        reviewLabel.textColor = .gray

        titleRow.addArrangedSubview(descriptionLabel)
        titleRow.addArrangedSubview(reviewLabel)

        // Detailed Description Label
        detailedDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        detailedDescriptionLabel.textColor = .black
        detailedDescriptionLabel.numberOfLines = 3
        detailedDescriptionLabel.lineBreakMode = .byTruncatingTail

        // Read More Button
        readMoreButton.setTitle("Read more", for: .normal)
        readMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        readMoreButton.tintColor = .systemBlue
        readMoreButton.addTarget(self, action: #selector(toggleReadMore), for: .touchUpInside)

        // Add views to stack
        stackView.addArrangedSubview(titleRow)
        stackView.addArrangedSubview(detailedDescriptionLabel)
        stackView.addArrangedSubview(readMoreButton)

        addSubview(stackView)

        // Constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            reviewLabel.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20)
        ])
    }

    func configure(description: String) {
        fullDescriptionText = description
        detailedDescriptionLabel.text = description
    }

    @objc private func toggleReadMore() {
        isExpanded.toggle()

        UIView.animate(withDuration: 0.3) {
            self.detailedDescriptionLabel.numberOfLines = self.isExpanded ? 0 : 3
            self.readMoreButton.setTitle(self.isExpanded ? "Read less" : "Read more", for: .normal)
            self.layoutIfNeeded()
        }
    }
}
