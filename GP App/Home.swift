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
        
        for imageName in ["Thumb1", "Thumb2", "Thumb3"] {
            let button = createThumbButton(withImage: imageName)
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
    }
    
    func createThumbButton(withImage imageName: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.clipsToBounds = true
        
        // Add chevron image view to the button
        let chevronImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        chevronImageView.tintColor = .white
        chevronImageView.contentMode = .center
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12),
            chevronImageView.widthAnchor.constraint(equalToConstant: 20),
            chevronImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        button.addTarget(self, action: #selector(thumbButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc func thumbButtonTapped(sender: UIButton) {
        let portfolioTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PortfolioTabBarController") as! PortfolioTabBarController
        navigationController?.pushViewController(portfolioTabBarController, animated: true)
    }
}
