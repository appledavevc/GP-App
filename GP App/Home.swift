//
//  Home.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 08/07/2023.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation bar background image
        let backgroundImage = UIImage(named: "Orange")
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        
        // Configure large title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        // Set large title attributes
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // Enable scroll edge appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        // Do any additional setup for your Home view controller...
    }
}
