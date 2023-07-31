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

        // Add subviews to the cell's contentView
        contentView.addSubview(iconImageView) // Show iconImageView first
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(vaultButton)

        // Set up constraints for the subviews
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.1 * contentView.bounds.height), // 10% of the screen height
            iconImageView.widthAnchor.constraint(equalToConstant: 156.25), // Increase the width by 25% (125% of the original width)
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor), // Keep the iconImageView square

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 0.05 * contentView.bounds.height), // 5% of the screen height

            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),

            vaultButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vaultButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40), // Increased space to 40 points
            vaultButton.widthAnchor.constraint(equalToConstant: 180), // Adjust the button's width as desired
            vaultButton.heightAnchor.constraint(equalToConstant: 60), // Adjust the button's height as desired
            vaultButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0.1 * contentView.bounds.height) // 10% of the screen height
        ])

        // Add tap gesture recognizer to the vaultButton
        vaultButton.addTarget(self, action: #selector(vaultButtonTapped), for: .touchUpInside)
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
