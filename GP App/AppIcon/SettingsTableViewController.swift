//
//  SettingsTableViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 27/07/2023.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let appIcons: [AppIcon] = [
        AppIcon(name: "GP Default", imageName: nil),
        AppIcon(name: "GP Orange", imageName: "AppIcon2"),
        AppIcon(name: "GP Pink", imageName: "AppIcon3")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "appIconCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appIcons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appIconCell", for: indexPath)

        let appIcon = appIcons[indexPath.row]
        cell.textLabel?.text = appIcon.name

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let appIcon = appIcons[indexPath.row]
        if let imageName = appIcon.imageName {
            setAppIcon(with: imageName)
        } else {
            resetAppIconToDefault()
        }
    }

    // MARK: - App Icon Handling

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
