//
//  PortfolioTabBarController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 11/08/2023.
//

import UIKit

class PortfolioTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the navigation title to "Portfolio" with large title style
        navigationItem.title = "Portfolio"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Retrieve the storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate view controllers from storyboard using their identifiers
        let featuredVC = storyboard.instantiateViewController(withIdentifier: "FeaturedViewController")
        let newVC = storyboard.instantiateViewController(withIdentifier: "NewViewController")
        let landscapeVC = storyboard.instantiateViewController(withIdentifier: "LandscapeViewController")
        let portraitVC = storyboard.instantiateViewController(withIdentifier: "PortraitViewController")
        
        // Set the view controllers for the tab bar
        viewControllers = [featuredVC, newVC, landscapeVC, portraitVC]
        
        // Customize tab bar appearance if needed
        tabBar.tintColor = .systemBlue
    }
}
