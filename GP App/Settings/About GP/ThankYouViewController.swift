//
//  ThankYouViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 02/08/2023.
//

import UIKit

class ThankYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        playHapticFeedback()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        title = "Thank You"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 34),
            .foregroundColor: UIColor.label
        ]
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground

        // Create an UIImageView for the background image
        let backgroundImageView = UIImageView(image: UIImage(named: "AppBackground"))
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)

        // Send the background image to the back to ensure other views are visible
        view.sendSubviewToBack(backgroundImageView)

        // Add a stack view to arrange the labels, button, and image vertically
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16 // Adjusted spacing between paragraphs
        view.addSubview(stackView)

        // "GPAppIconTW" image view
        let imageView = UIImageView(image: UIImage(named: "GPAppIconTW"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        // Constraints for the background image view
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        // Constraints for the stack view and image view
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40), // Place the logo below the top safe area
            imageView.heightAnchor.constraint(equalToConstant: 200), // Increase the height for a larger logo
        ])

        // "Thank you for downloading our app" label
        let thankYouLabel = UILabel()
        thankYouLabel.text = "Thank you for downloading our app"
        thankYouLabel.font = UIFont.boldSystemFont(ofSize: 36) // Increase font size and make it bolder
        thankYouLabel.textColor = UIColor(named: "GPOrange") // Change color to GPOrange
        thankYouLabel.textAlignment = .center
        thankYouLabel.numberOfLines = 0 // Allow multiple lines
        thankYouLabel.adjustsFontForContentSizeCategory = true // Dynamic font size adjustment
        thankYouLabel.isAccessibilityElement = true
        thankYouLabel.accessibilityLabel = "Thank you for downloading our app"
        stackView.addArrangedSubview(thankYouLabel)

        // "Please give us a positive review on the App Store" label
        let reviewLabel = UILabel()
        reviewLabel.text = "Please give us a positive review on the App Store"
        reviewLabel.font = UIFont.preferredFont(forTextStyle: .subheadline) // Dynamic font sizing
        reviewLabel.textColor = .label // Use .label for automatic Dark Mode support
        reviewLabel.textAlignment = .center
        reviewLabel.adjustsFontForContentSizeCategory = true // Dynamic font size adjustment
        reviewLabel.isAccessibilityElement = true
        reviewLabel.accessibilityLabel = "Please give us a positive review on the App Store"
        stackView.addArrangedSubview(reviewLabel)

        // Review Button
        let reviewButton = UIButton(type: .system)
        reviewButton.setTitle("Leave a Review", for: .normal)
        reviewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        reviewButton.addTarget(self, action: #selector(openReviewPage), for: .touchUpInside)
        reviewButton.backgroundColor = UIColor.systemBlue // Blue background color for the button
        reviewButton.setTitleColor(.white, for: .normal) // White text color
        reviewButton.layer.cornerRadius = 12 // Increased corner radius
        reviewButton.isAccessibilityElement = true
        reviewButton.accessibilityLabel = "Leave a Review"
        stackView.addArrangedSubview(reviewButton) // Add the button to the stackView

        // Constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40), // Move to the bottom
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40), // Add leading space
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40), // Add trailing space
        ])
    }

    private func playHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }

    @objc private func openReviewPage() {
        // Replace with your app's App Store URL
        if let reviewURL = URL(string: "https://apps.apple.com/us/app/gp-ghent-photography/id6451088808") {
            UIApplication.shared.open(reviewURL, options: [:], completionHandler: nil)
        }
    }
}
