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
    let aboutOptions = ["Release notes", "Thank you", "TestFlight"]
    let policiesOptions = ["Privacy Policy", "Copyright", "Photo Quality"]

    private var hasPerformedExplosionAnimation = false // Add this flag

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
        
        // Add tap gesture recognizer to the AppIconImageView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(appIconImageViewTapped))
        appIconImageView.addGestureRecognizer(tapGesture)
        appIconImageView.isUserInteractionEnabled = true
    }
    
    // MARK: - Tap Gesture Recognizer Action
    
    @objc private func appIconImageViewTapped() {
        // Perform your animation or action here for the Easter egg
        // For example, you can use UIView animations to scale or rotate the image
        UIView.animate(withDuration: 0.5, animations: {
            // Add a rotation animation
            self.tableView.tableHeaderView?.subviews.first?.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                // Remove the rotation animation
                self.tableView.tableHeaderView?.subviews.first?.transform = .identity
            }
        }

        // Add a floating animation
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            // Move the image view slightly up and down
            self.tableView.tableHeaderView?.subviews.first?.transform = CGAffineTransform(translationX: 0, y: -10)
        }, completion: nil)

        // After 5 seconds, trigger the explosion animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.performExplosionAnimation()
        }
    }

    private func performExplosionAnimation() {
        guard let appIconImageView = tableView.tableHeaderView?.subviews.first as? UIImageView else {
            return
        }

        // Disable the floating animation during the explosion
        appIconImageView.layer.removeAllAnimations()

        if !hasPerformedExplosionAnimation { // Check the flag before performing the explosion animation
            hasPerformedExplosionAnimation = true

            // Animate the explosion effect
            UIView.animate(withDuration: 0.15, animations: {
                appIconImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { _ in
                UIView.animate(withDuration: 0.15, animations: {
                    appIconImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
                    appIconImageView.alpha = 0.0
                }) { _ in
                    // After the explosion, reset the image view to its normal state
                    UIView.animate(withDuration: 0.15, animations: {
                        appIconImageView.transform = .identity
                        appIconImageView.alpha = 1.0
                    })
                }
            }
        }
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
            cell.iconImageView.image = UIImage(systemName: "lock.shield.fill")
            cell.titleLabel.text = generalOptions[indexPath.row]
        case 1:
            switch indexPath.row {
            case 0:
                if let image = UIImage(systemName: "moon.fill") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = appearanceOptions[indexPath.row]
            case 1:
                if let image = UIImage(systemName: "app.badge") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = appearanceOptions[indexPath.row]
            case 2:
                if let image = UIImage(systemName: "paintpalette.fill") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = appearanceOptions[indexPath.row]
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                if let image = UIImage(systemName: "doc.text.fill") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = aboutOptions[indexPath.row]
            case 1:
                if let image = UIImage(systemName: "heart.fill") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = aboutOptions[indexPath.row]
            case 2:
                if let image = UIImage(systemName: "person.crop.circle.badge.plus") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = aboutOptions[indexPath.row]
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                if let image = UIImage(systemName: "lock.fill") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = policiesOptions[indexPath.row]
            case 1:
                if let image = UIImage(systemName: "doc.richtext.fill") {
                    cell.iconImageView.image = image
                }
                cell.titleLabel.text = policiesOptions[indexPath.row]
            case 2:
                if let image = UIImage(systemName: "photo.fill") {
                    cell.iconImageView.image = image
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 2 && indexPath.row == 0 { // "Release notes" button tapped
            let releaseNotesVC = ReleaseNotesViewController()
            navigationController?.pushViewController(releaseNotesVC, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 2 { // "TestFlight" button tapped
            if let url = URL(string: "https://testflight.apple.com/join/EyTo5acT") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
