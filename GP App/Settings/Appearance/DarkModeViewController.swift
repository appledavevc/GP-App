//
//  DarkModeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 03/08/2023.
//

import UIKit

class DarkModeViewController: UITableViewController {

    private let darkModeKey = "DarkModeEnabled"

    let options = ["Enable Dark mode", "Disable Dark mode", "Use System Preferences"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.tableFooterView = UIView() // To hide empty rows at the bottom
        title = "Dark mode" // Set the large title in the navigation bar
    }

    private func setupTableView() {
        tableView.register(DarkModeTableViewCell.self, forCellReuseIdentifier: DarkModeTableViewCell.reuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

        // Restore switches' state from UserDefaults
        if let enableCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? DarkModeTableViewCell {
            enableCell.switchControl.isOn = UserDefaults.standard.bool(forKey: darkModeKey)
        }

        if let disableCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? DarkModeTableViewCell {
            disableCell.switchControl.isOn = !UserDefaults.standard.bool(forKey: darkModeKey)
        }
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
                UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.forEach { windowScene in
                    windowScene.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .dark
                    }
                }
            }
        } else {
            // Set app-wide light mode appearance here
            if #available(iOS 13.0, *) {
                UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.forEach { windowScene in
                    windowScene.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .light
                    }
                }
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveSwitchesState()
    }

    private func saveSwitchesState() {
        let indexPaths = [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)]
        for indexPath in indexPaths {
            if let cell = tableView.cellForRow(at: indexPath) as? DarkModeTableViewCell {
                let isOn = cell.switchControl.isOn
                UserDefaults.standard.set(isOn, forKey: darkModeKey)
            }
        }
    }

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

                // Update "Use System Preferences" button style
                if indexPath.row == 2 {
                    cell.contentView.backgroundColor = .systemBackground
                    cell.titleLabel.textColor = .label
                }

                // Turn off "Enable Dark mode" when "Disable Dark mode" is switched on
                if indexPath.row == 1 && isOn {
                    if let enableCell = tableView.cellForRow(at: IndexPath(row: 0, section: indexPath.section)) as? DarkModeTableViewCell {
                        enableCell.switchControl.isOn = false
                        self?.setAppWideDarkMode(false)
                    }
                }

                // Turn off "Disable Dark mode" when "Enable Dark mode" is switched on
                if indexPath.row == 0 && isOn {
                    if let disableCell = tableView.cellForRow(at: IndexPath(row: 1, section: indexPath.section)) as? DarkModeTableViewCell {
                        disableCell.switchControl.isOn = false
                        self?.setAppWideDarkMode(true)
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

            // Update "Use System Preferences" button style
            if let cell = tableView.cellForRow(at: indexPath) as? DarkModeTableViewCell {
                cell.contentView.backgroundColor = .clear
                cell.titleLabel.textColor = .systemBlue
            }
        default:
            break
        }
    }
}

