//
//  DarkModeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 04/08/2023.
//

import UIKit

class DarkModeViewController: UITableViewController {

    private let darkModeKey = "DarkModeEnabled"

    let options = ["Enable Dark mode", "Enable Light mode"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        tableView.tableFooterView = UIView() // To hide empty rows at the bottom

        // Set initial state of switches based on the app's current appearance
        if #available(iOS 13.0, *) {
            let currentAppearance = traitCollection.userInterfaceStyle
            switch currentAppearance {
            case .dark:
                let darkModeSwitch = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? DarkModeTableViewCell
                darkModeSwitch?.switchControl.isOn = true
                UserDefaults.standard.set(true, forKey: darkModeKey)
            case .light:
                let lightModeSwitch = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? DarkModeTableViewCell
                lightModeSwitch?.switchControl.isOn = true
                UserDefaults.standard.set(false, forKey: darkModeKey)
            default:
                break
            }
        }
    }

    private func setupNavigationBar() {
        title = "Dark mode"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupTableView() {
        tableView.register(DarkModeTableViewCell.self, forCellReuseIdentifier: DarkModeTableViewCell.reuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @objc private func darkModeSwitchValueChanged(_ sender: UISwitch) {
        let isEnabled = sender.isOn

        switch sender.tag {
        case 0:
            UserDefaults.standard.set(isEnabled, forKey: darkModeKey)
            setAppWideDarkMode(isEnabled)
            if isEnabled {
                let lightModeSwitch = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? DarkModeTableViewCell
                lightModeSwitch?.switchControl.isOn = false
            }
        case 1:
            UserDefaults.standard.set(isEnabled, forKey: darkModeKey)
            setAppWideDarkMode(!isEnabled)
            if isEnabled {
                let darkModeSwitch = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? DarkModeTableViewCell
                darkModeSwitch?.switchControl.isOn = false
            }
        default:
            break
        }
    }

    private func setAppWideDarkMode(_ enabled: Bool) {
        if enabled {
            // Set app-wide dark mode appearance here
            if #available(iOS 13.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    windowScene.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .dark
                    }
                }
            }
        } else {
            // Set app-wide light mode appearance here
            if #available(iOS 13.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    windowScene.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .light
                    }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: DarkModeTableViewCell.reuseIdentifier, for: indexPath) as! DarkModeTableViewCell

        cell.titleLabel.text = options[indexPath.row]

        // Set the icon image for moon (dark mode) and sun (light mode)
        if indexPath.row == 0 {
            cell.iconImageView.image = UIImage(systemName: "moon.fill")
        } else if indexPath.row == 1 {
            cell.iconImageView.image = UIImage(systemName: "sun.max.fill")
        }

        // Set the switch state based on the user's preference
        let isDarkModeEnabled = UserDefaults.standard.bool(forKey: darkModeKey)
        cell.switchControl.isOn = indexPath.row == 0 ? isDarkModeEnabled : !isDarkModeEnabled

        cell.switchValueChanged = { [weak self] isOn in
            self?.switchValueChanged(isOn, cell: cell, at: indexPath)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        // Disable tapping for cells containing switches
        return indexPath.row >= options.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false) // Deselect the row immediately
    }

    private func switchValueChanged(_ isOn: Bool, cell: DarkModeTableViewCell, at indexPath: IndexPath) {
        if isOn {
            if indexPath.row == 0 {
                UserDefaults.standard.set(true, forKey: darkModeKey)
                setAppWideDarkMode(true)
                let lightModeSwitch = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? DarkModeTableViewCell
                lightModeSwitch?.switchControl.isOn = false
            } else if indexPath.row == 1 {
                UserDefaults.standard.set(false, forKey: darkModeKey)
                setAppWideDarkMode(false)
                let darkModeSwitch = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? DarkModeTableViewCell
                darkModeSwitch?.switchControl.isOn = false
            }
        }
    }
}

