//
//  AppIconViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 05/10/2023.
//

import UIKit

struct AppIcon {
    let name: String
    let description: String

    var isSelected: Bool {
        return UIApplication.shared.alternateIconName == name
    }
}

class AppIconViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "Background")
        return tableView
    }()

    // Define your alternate app icons and their names
    let appIcons: [AppIcon] = [
        AppIcon(name: "AppIcon", description: "Default Icon"),
        AppIcon(name: "AppIcon1", description: "GP Dusk"),
        AppIcon(name: "AppIcon2", description: "GP City Centre"),
    ]

    let defaultIcon = UIImage(named: "AppIcon") // Default app icon

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App icon"

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground

        // Create a header view with the current app icon
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 160))
        let appIconImageView = UIImageView(image: getCurrentAppIcon() ?? defaultIcon)
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
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return appIcons.count // GP Originals section has the alternate app icons
        } else {
            return 1 // Revert to Default section has one row for the button
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppIconCell", for: indexPath)

        if indexPath.section == 0 {
            let appIcon = appIcons[indexPath.row]

            // Display the app icon thumbnail in the cell
            if let appIconImage = UIImage(named: appIcon.name) {
                cell.imageView?.image = appIconImage
                cell.imageView?.layer.cornerRadius = 12
                cell.imageView?.clipsToBounds = true
            }

            cell.textLabel?.text = appIcon.description
        } else {
            cell.textLabel?.text = "Revert to Default Icon"
            cell.textLabel?.textColor = .systemRed
        }

        cell.textLabel?.adjustsFontForContentSizeCategory = true

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "GP Originals"
        } else {
            return "Revert to Default"
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let selectedAppIcon = appIcons[indexPath.row]
            setAppIcon(appIcon: selectedAppIcon)
            tableView.reloadData()
        } else {
            revertToDefaultIcon()
        }

        // Deselect the selected cell
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - App Icon Change

    private func setAppIcon(appIcon: AppIcon) {
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(appIcon.name) { [weak self] error in
                if let error = error {
                    self?.showErrorAlert(message: "Failed to change the app's icon: \(error.localizedDescription)")
                } else {
                    self?.showSuccessAlert(message: "App icon changed successfully to \(appIcon.description)")
                }
            }
        } else {
            showErrorAlert(message: "Changing app icon is not supported on this device.")
        }
    }

    private func revertToDefaultIcon() {
        UIApplication.shared.setAlternateIconName(nil) { [weak self] error in
            if let error = error {
                self?.showErrorAlert(message: "Failed to change the app's icon: \(error.localizedDescription)")
            } else {
                self?.showSuccessAlert(message: "App icon changed successfully to Default Icon")
            }
        }
    }

    // Get the currently selected app icon
    private func getCurrentAppIcon() -> UIImage? {
        if let alternateIconName = UIApplication.shared.alternateIconName,
           let appIcon = appIcons.first(where: { $0.name == alternateIconName }),
           let appIconImage = UIImage(named: appIcon.name) {
            return appIconImage
        }
        return defaultIcon // Default app icon
    }

    // MARK: - Helper Methods

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
