//
//  SettingsViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 02/08/2023.
//

import UIKit

class SettingsViewController: UITableViewController {

    let sections = ["General", "Appearance", "About GP app", "Policies"]
    let generalOptions = ["Push Notifications"]
    let appearanceOptions = ["Dark Mode", "App Icon", "App Theme"]
    let aboutOptions = ["Release notes", "Thank you", "Visit GP Website"]
    let policiesOptions = ["Privacy Policy", "Copyright", "Photo Quality"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        tableView.tableFooterView = UIView() // To hide empty rows at the bottom
    }

    private func setupHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 160))
        
        // Add the AppIconImageView
        let appIconImageView = UIImageView(image: UIImage(named: "AppIcon"))
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        appIconImageView.contentMode = .scaleAspectFill
        appIconImageView.layer.cornerRadius = 24 // You can adjust this value to make it bigger
        appIconImageView.clipsToBounds = true // Clip the image to avoid white space
        headerView.addSubview(appIconImageView)
        
        // Add the "Dave Van Cauwenberghe - v1.5.1" label
        let versionLabel = UILabel()
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.text = "© Dave Van Cauwenberghe - v1.5.1"
        versionLabel.textAlignment = .center
        versionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        versionLabel.textColor = .darkGray
        headerView.addSubview(versionLabel)
        
        NSLayoutConstraint.activate([
            // AppIconImageView constraints
            appIconImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            appIconImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            appIconImageView.widthAnchor.constraint(equalToConstant: 100), // Adjust this size as needed
            appIconImageView.heightAnchor.constraint(equalTo: appIconImageView.widthAnchor), // Aspect ratio is preserved
            
            // Version label constraints
            versionLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            versionLabel.topAnchor.constraint(equalTo: appIconImageView.bottomAnchor, constant: 8), // Adjust the spacing as needed
        ])
        
        tableView.tableHeaderView = headerView
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return generalOptions.count
        case 1:
            return appearanceOptions.count
        case 2:
            return aboutOptions.count
        case 3:
            return policiesOptions.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsViewCell
        
        switch indexPath.section {
        case 0:
            cell.iconImageView.image = UIImage(systemName: "lock.shield.fill") // Example icon for "Push Notifications"
            cell.titleLabel.text = generalOptions[indexPath.row]
        case 1:
            switch indexPath.row {
            case 0:
                if let image = UIImage(systemName: "moon.fill") {
                    cell.iconImageView.image = image // Example icon for "Dark Mode"
                }
                cell.titleLabel.text = appearanceOptions[indexPath.row]
            case 1:
                if let image = UIImage(systemName: "app.badge") {
                    cell.iconImageView.image = image // Example icon for "App Icon"
                }
                cell.titleLabel.text = appearanceOptions[indexPath.row]
            case 2:
                if let image = UIImage(systemName: "paintpalette.fill") {
                    cell.iconImageView.image = image // Example icon for "App Theme"
                }
                cell.titleLabel.text = appearanceOptions[indexPath.row]
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                if let image = UIImage(systemName: "doc.text.fill") {
                    cell.iconImageView.image = image // Example icon for "Release notes"
                }
                cell.titleLabel.text = aboutOptions[indexPath.row]
            case 1:
                if let image = UIImage(systemName: "heart.fill") {
                    cell.iconImageView.image = image // Example icon for "Thank you"
                }
                cell.titleLabel.text = aboutOptions[indexPath.row]
            case 2:
                if let image = UIImage(systemName: "globe") {
                    cell.iconImageView.image = image // Example icon for "Visit GP Website"
                }
                cell.titleLabel.text = aboutOptions[indexPath.row]
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                if let image = UIImage(systemName: "lock.fill") {
                    cell.iconImageView.image = image // Example icon for "Privacy Policy"
                }
                cell.titleLabel.text = policiesOptions[indexPath.row]
            case 1:
                if let image = UIImage(systemName: "doc.richtext.fill") {
                    cell.iconImageView.image = image // Example icon for "Copyright"
                }
                cell.titleLabel.text = policiesOptions[indexPath.row]
            case 2:
                if let image = UIImage(systemName: "photo.fill") {
                    cell.iconImageView.image = image // Example icon for "Photo Quality"
                }
                cell.titleLabel.text = policiesOptions[indexPath.row]
            default:
                break
            }
        default:
            break
        }
        
        return cell
    }
}
