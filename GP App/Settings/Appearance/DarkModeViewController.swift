//
//  DarkModeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 03/08/2023.
//

import UIKit

class DarkModeViewController: UITableViewController {

    private let darkModeKey = "DarkModeEnabled"

    let options = ["Enable Dark mode", "Enable Light mode", "Use System Preferences"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.tableFooterView = UIView() // To hide empty rows at the bottom
        title = "Dark mode" // Set the title for the navigation bar
    }

    private func setupTableView() {
        tableView.register(DarkModeViewCell.self, forCellReuseIdentifier: DarkModeViewCell.reuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let darkModeEnabled = UserDefaults.standard.bool(forKey: darkModeKey)
        setAppWideDarkMode(darkModeEnabled)
    }

    @objc private func darkModeSwitchValueChanged(_ sender: UISwitch) {
        let isEnabled = sender.isOn
        UserDefaults.standard.set(isEnabled, forKey: darkModeKey)

        if isEnabled {
            setAppWideDarkMode(true)
        } else {
            setAppWideDarkMode(false)
        }
    }

    private func setAppWideDarkMode(_ enabled: Bool) {
        if enabled {
            // Set app-wide dark mode appearance here
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                for window in windowScene.windows {
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        } else {
            // Set app-wide light mode appearance here
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                for window in windowScene.windows {
                    window.overrideUserInterfaceStyle = .light
                }
            }
        }
    }
}

extension DarkModeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DarkModeViewCell.reuseIdentifier, for: indexPath) as! DarkModeViewCell

        // Check if the indexPath.row is within the bounds of the options array
        guard indexPath.row < options.count else {
            // Return an empty cell if the index is out of range
            return cell
        }

        cell.titleLabel.text = options[indexPath.row]
        cell.iconImageView.image = UIImage(systemName: indexPath.row == 0 ? "moon.fill" : indexPath.row == 1 ? "sun.max.fill" : "iphone")

        switch indexPath.row {
        case 0, 1:
            cell.switchControl.isHidden = false
            if indexPath.row == 0 {
                cell.switchControl.isOn = UserDefaults.standard.bool(forKey: darkModeKey)
            } else {
                cell.switchControl.isOn = !UserDefaults.standard.bool(forKey: darkModeKey)
            }
            cell.switchValueChanged = { [weak self] isOn in
                self?.setAppWideDarkMode(indexPath.row == 0 ? isOn : !isOn)

                // Update "Use System Preferences" button style
                if indexPath.row == 2 {
                    cell.contentView.backgroundColor = .clear
                    cell.titleLabel.textColor = .systemBlue
                }

                // Turn off "Enable Dark mode" when "Enable Light mode" is switched on
                if indexPath.row == 1 && isOn {
                    if let enableCell = tableView.cellForRow(at: IndexPath(row: 0, section: indexPath.section)) as? DarkModeViewCell {
                        enableCell.switchControl.isOn = false
                        self?.setAppWideDarkMode(false)
                        UserDefaults.standard.set(false, forKey: self?.darkModeKey ?? "")
                    }
                }

                // Turn off "Enable Light mode" when "Enable Dark mode" is switched on
                if indexPath.row == 0 && isOn {
                    if let disableCell = tableView.cellForRow(at: IndexPath(row: 1, section: indexPath.section)) as? DarkModeViewCell {
                        disableCell.switchControl.isOn = false
                        self?.setAppWideDarkMode(true)
                        UserDefaults.standard.set(true, forKey: self?.darkModeKey ?? "")
                    }
                }
            }
        default:
            cell.switchControl.isHidden = true
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 2:
            // Use System Preferences, so remove the user default setting for dark mode
            UserDefaults.standard.removeObject(forKey: darkModeKey)
            setAppWideDarkMode(false) // Let the system preferences decide

            // Update "Use System Preferences" button style
            if let cell = tableView.cellForRow(at: indexPath) as? DarkModeViewCell {
                cell.contentView.backgroundColor = .clear
                cell.titleLabel.textColor = .systemBlue
            }

            // Reset switches
            if let enableCell = tableView.cellForRow(at: IndexPath(row: 0, section: indexPath.section)) as? DarkModeViewCell {
                enableCell.switchControl.isOn = false
            }
            if let disableCell = tableView.cellForRow(at: IndexPath(row: 1, section: indexPath.section)) as? DarkModeViewCell {
                disableCell.switchControl.isOn = false
            }
        default:
            break
        }
    }
}
