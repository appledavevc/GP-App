//
//  VaultTableViewCell.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

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
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center // Center the text horizontally
        label.numberOfLines = 0
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.contentHorizontalAlignment = .center // Center the text horizontally
        button.contentVerticalAlignment = .center // Center the text vertically (optional)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add subviews to the cell's contentView
        contentView.addSubview(iconImageView) // Show iconImageView first
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(vaultButton)

        // Set up constraints for the subviews
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor), // Keep the iconImageView square
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), // Center the iconImageView horizontally

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16), // Increase the spacing between iconImageView and titleLabel

            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),

            vaultButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vaultButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            vaultButton.widthAnchor.constraint(equalToConstant: 180), // Adjust the button's width as desired
            vaultButton.heightAnchor.constraint(equalToConstant: 60), // Adjust the button's height as desired
            vaultButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


