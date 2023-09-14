//
//  Home.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 08/07/2023.
//

import UIKit

class Home: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view controller's title
        title = "Ghent Photography"
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let buttonSize = CGSize(width: view.bounds.width - 32, height: view.bounds.width - 32)
        let spacing: CGFloat = 16
        
        var previousButton: UIButton?
        
        for (index, imageName) in ["Thumb1", "Thumb2", "Thumb3"].enumerated() {
            let button = createThumbButton(withImage: imageName, tag: index + 1)
            scrollView.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: buttonSize.width),
                button.heightAnchor.constraint(equalToConstant: buttonSize.height),
                button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ])
            
            if let previous = previousButton {
                NSLayoutConstraint.activate([
                    button.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: spacing)
                ])
            } else {
                NSLayoutConstraint.activate([
                    button.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: spacing)
                ])
            }
            
            previousButton = button
        }
        
        // Set the content size of the scroll view
        scrollView.contentSize = CGSize(width: view.bounds.width, height: buttonSize.height * CGFloat(3) + spacing * CGFloat(2))
        
        // Set appearance of the "Home" tab to have a blue tint
        tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
    }
    
    func createThumbButton(withImage imageName: String, tag: Int) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.clipsToBounds = true
        
        // Create container view for the chevron and its background
        let chevronContainerView = UIView()
        chevronContainerView.translatesAutoresizingMaskIntoConstraints = false
        chevronContainerView.layer.cornerRadius = 15 // Match the button's corner radius
        chevronContainerView.backgroundColor = .systemBlue
        button.addSubview(chevronContainerView)
        
        // Add chevron image view to the container
        let chevronImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        chevronImageView.tintColor = .white
        chevronImageView.contentMode = .center
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronContainerView.addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            chevronContainerView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            chevronContainerView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12),
            chevronContainerView.widthAnchor.constraint(equalToConstant: 30), // Adjust the width
            chevronContainerView.heightAnchor.constraint(equalToConstant: 30), // Adjust the height
            
            chevronImageView.centerXAnchor.constraint(equalTo: chevronContainerView.centerXAnchor),
            chevronImageView.centerYAnchor.constraint(equalTo: chevronContainerView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 20),
            chevronImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        button.addTarget(self, action: #selector(thumbButtonTapped), for: .touchUpInside)
        button.tag = tag
        
        // Set accessibility label for VoiceOver
        if tag == 1 {
            button.accessibilityLabel = "Portfolio Button"
        } else if tag == 2 {
            button.accessibilityLabel = "Vault Button"
        } else if tag == 3 {
            button.accessibilityLabel = "Settings Button"
        }
        
        return button
    }
    
    @objc func thumbButtonTapped(sender: UIButton) {
        if sender.tag == 1 { // Thumb1 button tapped
            let portfolioTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PortfolioTabBarController") as! PortfolioTabBarController
            navigationController?.pushViewController(portfolioTabBarController, animated: true)
        } else if sender.tag == 2 { // Thumb2 button tapped
            let vaultTabBarController = VaultTabBarController()
            navigationController?.pushViewController(vaultTabBarController, animated: true)
        } else if sender.tag == 3 { // Thumb3 button tapped
            let settingsTabBarController = SettingsTabBarController()
            navigationController?.pushViewController(settingsTabBarController, animated: true)
        }
    }
}
