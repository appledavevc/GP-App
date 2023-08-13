//
//  VaultTabBarController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 12/08/2023.
//

import UIKit

class VaultTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the navigation title to "Vault" with large title style
        navigationItem.title = "The Vault"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Retrieve the storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate VaultEntryViewController from storyboard using its identifier
        let vaultEntryVC = storyboard.instantiateViewController(withIdentifier: "VaultEntryViewController")
        
        // Set the view controllers for the tab bar
        viewControllers = [vaultEntryVC]
        
        // Customize tab bar appearance if needed
        tabBar.tintColor = .systemBlue
    }
}
