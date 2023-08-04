//
//  DarkModeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 04/08/2023.
//


import UIKit

class DarkModeViewController: UITableViewController {

    private let darkModeKey = "DarkModeEnabled"

    let options = ["Enable Dark mode", "Disable Dark mode", "Use System Preferences"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.tableFooterView = UIView() // To hide empty rows at the bottom
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
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        } else {
            // Set app-wide light mode appearance here
            if #available(iOS 13.0, *) {
                UIApplication.shared.windows.forEach { window in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: DarkModeTableViewCell.reuseIdentifier, for: indexPath) as! DarkModeTableViewCell

        cell.titleLabel.text = options[indexPath.row]

        switch indexPath.row {
        case 0, 1:
            cell.switchControl.isHidden = false
            cell.switchControl.isOn = UserDefaults.standard.bool(forKey: darkModeKey)
            cell.switchValueChanged = { [weak self] isOn in
                self?.setAppWideDarkMode(isOn)
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
        case 0:
            setAppWideDarkMode(true)
            UserDefaults.standard.set(true, forKey: darkModeKey)
        case 1:
            setAppWideDarkMode(false)
            UserDefaults.standard.set(false, forKey: darkModeKey)
        case 2:
            // Use System Preferences, so remove the user default setting for dark mode
            UserDefaults.standard.removeObject(forKey: darkModeKey)
            setAppWideDarkMode(false) // Let the system preferences decide
        default:
            break
        }
    }
}
