//
//  IconChangeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 07/10/2023.
//

import UIKit

class IconChangeViewController: UIViewController {
    
    let iconNames = [nil, "AppIcon1", "AppIcon2"] // nil represents the default icon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        let iconName = iconNames[sender.selectedSegmentIndex]
        changeIcon(to: iconName)
    }
    
    private func changeIcon(to name: String?) {
        // Check if the app supports changing icons
        guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
        
        // Change the icon to a specific image with the given name
        UIApplication.shared.setAlternateIconName(name) { error in
            if let error = error {
                print("App icon failed to change due to: \(error.localizedDescription)")
            } else {
                print("App icon changed successfully!")
            }
        }
    }
}

