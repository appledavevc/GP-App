//
//  VaultTableViewCell.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

protocol VaultTableViewCellDelegate: AnyObject {
    func vaultButtonTapped(in cell: VaultTableViewCell)
}

class VaultTableViewCell: UITableViewCell {

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // Set your image for the icon here
        imageView.image = UIImage(systemName: "lock.shield.fill")
        imageView.contentMode = .scaleAspectFit // Set the content mode to maintain aspect ratio
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center // Center the text horizontally
        label.numberOfLines = 0
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center // Center the text horizontally
        label.numberOfLines = 0
        return label
    }()

    let vaultButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue // Set the background color to system blue
        button.layer.cornerRadius = 20 // Adjust the corner radius to your desired value
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.contentHorizontalAlignment = .center // Center the text horizontally
        button.contentVerticalAlignment = .center // Center the text vertically (optional)
        return button
    }()

    weak var delegate: VaultTableViewCellDelegate?

    var isUnlocked: Bool = false {
        didSet {
            let imageName = isUnlocked ? "lock.open.fill" : "lock.shield.fill"
            iconImageView.image = UIImage(systemName: imageName)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add containerView to the cell's contentView
        contentView.addSubview(containerView)

        // Add subviews to the containerView
        containerView.addSubview(iconImageView) // Show iconImageView first
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(vaultButton)

        // Set up constraints for the containerView and its subviews
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6), // Adjust top constraint to 6 points
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0), // No space at the bottom

            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16), // Adjust top constraint to 16 points
            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9), // Increase width by 25% (125% of the original width)
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor), // Keep the iconImageView square

            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 12), // Increase space to 12 points

            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6), // Reduce the space to 6 points

            vaultButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vaultButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            vaultButton.widthAnchor.constraint(equalToConstant: 180),
            vaultButton.heightAnchor.constraint(equalToConstant: 60),
            vaultButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16) // Adjust bottom constraint to -16 points
        ])

        // Add tap gesture recognizer to the vaultButton
        vaultButton.addTarget(self, action: #selector(vaultButtonTapped), for: .touchUpInside)

        // Disable selection highlighting when tapped
        selectionStyle = .none
    }

    @objc func vaultButtonTapped() {
        delegate?.vaultButtonTapped(in: self)
    }

    func animateIconImageView(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.1, animations: {
            self.iconImageView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25) // Increase size by 25%
            self.vaultButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.iconImageView.transform = .identity
                self.vaultButton.transform = .identity
            }, completion: { _ in
                completion() // Call the completion block when the animation is completed
            })
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutMargins = UIEdgeInsets.zero
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
