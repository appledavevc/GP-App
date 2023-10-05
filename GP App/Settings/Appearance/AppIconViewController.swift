//
//  AppIconViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 05/10/2023.
//

import UIKit

class AppIconViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let appIconImages = ["AppIcon", "AppIcon", "AppIcon"] // Add more alternate app icons if needed
    
    let appIconNames = ["GP Launch", "GP Test", "GP Test 2"] // Custom names for the app icons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App Icon"
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Create a header view with the "AppIcon" image
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 160))
        let appIconImageView = UIImageView(image: UIImage(named: "AppIcon"))
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        appIconImageView.contentMode = .scaleAspectFill
        appIconImageView.layer.cornerRadius = 24
        appIconImageView.clipsToBounds = true
        headerView.addSubview(appIconImageView)
        
        NSLayoutConstraint.activate([
            appIconImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            appIconImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            appIconImageView.widthAnchor.constraint(equalToConstant: 100),
            appIconImageView.heightAnchor.constraint(equalTo: appIconImageView.widthAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AppIconCell")
        tableView.tableHeaderView = headerView
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Table View Delegate and Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Only one section for the app icon options
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appIconImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppIconCell", for: indexPath)
        let appIconName = appIconNames[indexPath.row]
        
        // Set the app icon image and round corners based on the selected name
        if let appIconImage = UIImage(named: appIconImages[indexPath.row]) {
            cell.imageView?.image = appIconImage
            cell.imageView?.layer.cornerRadius = 12
            cell.imageView?.clipsToBounds = true
        }
        
        cell.textLabel?.text = appIconName
        cell.textLabel?.adjustsFontForContentSizeCategory = true
        cell.textLabel?.accessibilityLabel = appIconName
        
        if appIconName == "GP Launch" {
            // Show a checkmark for the default app icon
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAppIconName = appIconImages[indexPath.row]
        setAppIcon(iconName: selectedAppIconName)
        
        // Deselect the selected cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - App Icon Change
    
    private func setAppIcon(iconName: String) {
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(iconName) { [weak self] error in
                if let error = error {
                    print("Failed to change the app's icon: \(error.localizedDescription)")
                } else {
                    print("App icon changed successfully to \(iconName)")
                    // Refresh the view or take further action if needed
                }
            }
        } else {
            print("Changing app icon is not supported on this device.")
        }
    }
}
