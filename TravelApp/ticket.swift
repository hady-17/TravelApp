import UIKit

class FlightTicketView: UIView {

    private let cornerRadius: CGFloat = 16
    private let notchRadius: CGFloat = 16

    private let departureLabel = UILabel()
    private let arrivalLabel = UILabel()
    private let dateLabel = UILabel()
    private let bookingIDLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .clear
        setupLabels()
        layoutLabels()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyTicketMask()
        applyGradientBackground()
        drawDashedSeparator()
    }

    private func applyTicketMask() {
        let width = bounds.width
        let height = bounds.height
        let centerY = height / 2

        let path = UIBezierPath()

        // Top-left Corner
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))

        // Top-right Corner
        path.addArc(withCenter: CGPoint(x: width - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: -CGFloat.pi / 2,
                    endAngle: 0,
                    clockwise: true)

        // Right Notch
        path.addLine(to: CGPoint(x: width, y: centerY - notchRadius))
        path.addArc(withCenter: CGPoint(x: width, y: centerY),
                    radius: notchRadius,
                    startAngle: -CGFloat.pi / 2,
                    endAngle: CGFloat.pi / 2,
                    clockwise: false)
        path.addLine(to: CGPoint(x: width, y: height - cornerRadius))

        // Bottom-right Corner
        path.addArc(withCenter: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: 0,
                    endAngle: CGFloat.pi / 2,
                    clockwise: true)

        path.addLine(to: CGPoint(x: cornerRadius, y: height))

        // Bottom-left Corner
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: CGFloat.pi / 2,
                    endAngle: CGFloat.pi,
                    clockwise: true)

        // Left Notch
        path.addLine(to: CGPoint(x: 0, y: centerY + notchRadius))
        path.addArc(withCenter: CGPoint(x: 0, y: centerY),
                    radius: notchRadius,
                    startAngle: CGFloat.pi / 2,
                    endAngle: -CGFloat.pi / 2,
                    clockwise: true)
        
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))

        // Top-left Corner
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: CGFloat.pi,
                    endAngle: -CGFloat.pi / 2,
                    clockwise: true)

        path.close()

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }



    private func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        if let existingGradient = layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            existingGradient.removeFromSuperlayer()
        }
        layer.insertSublayer(gradientLayer, at: 0)
    }

    private func drawDashedSeparator() {
        let dashLayer = CAShapeLayer()
        dashLayer.strokeColor = UIColor.darkGray.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [4, 4]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: notchRadius, y: bounds.height / 2), CGPoint(x: bounds.width - notchRadius, y: bounds.height / 2)])
        dashLayer.path = path
        if let existingDash = layer.sublayers?.first(where: { $0.name == "dashedSeparator" }) {
            existingDash.removeFromSuperlayer()
        }
        dashLayer.name = "dashedSeparator"
        layer.addSublayer(dashLayer)
    }

    private func setupLabels() {
        [departureLabel, arrivalLabel, dateLabel, bookingIDLabel].forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
        }
        departureLabel.text = "CGK 05:30"
        arrivalLabel.text = "DPS 08:30"
        dateLabel.text = "24 March 2024"
        bookingIDLabel.text = "Booking ID: ZE3BAW"
    }

    private func layoutLabels() {
        NSLayoutConstraint.activate([
            departureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            departureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            arrivalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            arrivalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            dateLabel.topAnchor.constraint(equalTo: departureLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            bookingIDLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            bookingIDLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
