//
//  IconChangeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 07/10/2023.
//

import UIKit

class IconChangeViewController: UIViewController {
    
    // An array of icon names (using optional String to allow nil for the default icon)
    let iconNames: [String?] = [nil, "AppIcon1", "AppIcon2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Set the title in the navigation bar
        self.title = "App Icon"
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let segmentedControl = UISegmentedControl(items: ["Default", "AppIcon1", "AppIcon2"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(iconChanged(_:)), for: .valueChanged)
        
        view.addSubview(segmentedControl)
        
        // Setup constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func iconChanged(_ sender: UISegmentedControl) {
        // Obtain the icon name from the array using the selected segment index
        let iconName = iconNames[sender.selectedSegmentIndex]
        // Attempt to change the app icon
        changeIcon(to: iconName)
    }
    
    private func changeIcon(to name: String?) {
        // Check if the app supports changing icons
        guard UIApplication.shared.supportsAlternateIcons else {
            print("App does not support alternate icons.") // Log if not supported
            return
        }
        
        // Change the icon to a specific image with the given name
        UIApplication.shared.setAlternateIconName(name) { error in
            if let error = error {
                // Log the error if the icon change fails
                print("App icon failed to change due to: \(error.localizedDescription)")
            } else {
                // Log the success if the icon change is successful
                print("App icon changed successfully!")
            }
        }
    }
}
