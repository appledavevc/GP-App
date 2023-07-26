//
//  SettingsViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 26/07/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let appIcons: [AppIcon] = [
        AppIcon(name: "Default", imageName: nil),
        AppIcon(name: "Orange", imageName: "Icon1"),
        AppIcon(name: "Pink", imageName: "Icon2"),
        // Add more app icons as needed
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appIcons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appIconCell", for: indexPath)

        let appIcon = appIcons[indexPath.row]
        cell.textLabel?.text = appIcon.name

        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let appIcon = appIcons[indexPath.row]
        if let imageName = appIcon.imageName {
            setAppIcon(with: imageName)
        } else {
            resetAppIconToDefault()
        }
    }
    
    private func setAppIcon(with name: String) {
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(name) { error in
                if let error = error {
                    print("Error setting app icon: \(error.localizedDescription)")
                } else {
                    print("App icon changed successfully to \(name).")
                }
            }
        }
    }

    private func resetAppIconToDefault() {
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(nil) { error in
                if let error = error {
                    print("Error resetting app icon: \(error.localizedDescription)")
                } else {
                    print("App icon reset to default successfully.")
                }
            }
        }
    }
}

struct AppIcon {
    let name: String
    let imageName: String?
}


