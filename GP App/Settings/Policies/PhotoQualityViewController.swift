//
//  PhotoQualityViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 02/08/2023.
//

import UIKit

class PhotoQualityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        title = "Photo Quality"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 34), // Adjust the font size as needed
            .foregroundColor: UIColor.label // Use .label for automatic Dark Mode support
        ]
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground // Set the view background color to system background color

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Photo Quality"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        contentView.addSubview(titleLabel)

        let photoQualityLabel = UILabel()
        photoQualityLabel.translatesAutoresizingMaskIntoConstraints = false
        photoQualityLabel.text = """
        Our app allows you to choose the photo quality when uploading images. You can select between different options to optimize data usage and storage on your device.

        1. High Quality
        The "High Quality" option provides the best image resolution and is recommended for users who want the best visual experience. Keep in mind that selecting this option may consume more data and take up more storage on your device.

        2. Medium Quality
        The "Medium Quality" option offers a balance between image resolution and data usage. This is a good option if you want decent image quality while conserving data and storage.

        3. Low Quality
        The "Low Quality" option reduces the image resolution to save data and storage space. This is ideal for users with limited data plans or low device storage.

        You can change the photo quality setting at any time from the app settings.

        Thank you for using the Ghent Photography app. We hope you enjoy capturing and sharing moments with our app!
        """
        photoQualityLabel.numberOfLines = 0
        photoQualityLabel.textColor = .label // Set the text color to system label color (works with Dark Mode)
        photoQualityLabel.backgroundColor = .systemBackground // Set the background color to system background color (works with Dark Mode)
        contentView.addSubview(photoQualityLabel)

        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView constraints
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Title label constraints
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),

            // Photo quality label constraints
            photoQualityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            photoQualityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            photoQualityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            photoQualityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])

        // Apply bold and larger font size to specific titles
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 // Adjust the line spacing as needed

        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 17), // Adjust the font size as needed
            .foregroundColor: UIColor.label, // Use .label for automatic Dark Mode support
            .paragraphStyle: paragraphStyle
        ]

        let largerBoldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20), // Adjust the font size as needed
            .foregroundColor: UIColor.label, // Use .label for automatic Dark Mode support
            .paragraphStyle: paragraphStyle
        ]

        let formattedText = NSMutableAttributedString(string: photoQualityLabel.text ?? "", attributes: nil)
        let photoQualityLines = photoQualityLabel.text?.components(separatedBy: "\n") ?? []

        for line in photoQualityLines {
            if line.hasPrefix("1. High Quality") {
                // Apply larger and bold attributes to the title
                let range = (formattedText.string as NSString).range(of: line)
                formattedText.addAttributes(largerBoldAttributes, range: range)
            } else if line.hasPrefix("1.") || line.hasPrefix("2.") || line.hasPrefix("3.") {
                // Apply bold attributes to section titles
                let range = (formattedText.string as NSString).range(of: line)
                formattedText.addAttributes(boldAttributes, range: range)
            }
        }

        // Apply the formatted text to the UITextView
        photoQualityLabel.attributedText = formattedText
    }
}
