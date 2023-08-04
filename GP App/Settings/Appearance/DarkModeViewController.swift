//
//  DarkModeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 04/08/2023.
//

import UIKit

class DarkModeViewController: UITableViewController {
    let darkModeOptions: [DarkModeViewCell.DarkModeOption] = [.enableDarkMode, .enableLightMode, .useSystemPreferences]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "DarkModeViewCell", bundle: nil), forCellReuseIdentifier: "darkCell")

        // Load user's saved preference
        let savedPreference = UserDefaults.standard.integer(forKey: "DarkModePreference")
        if let option = DarkModeViewCell.DarkModeOption(rawValue: savedPreference) {
            switchDarkMode(to: option)
        }
    }

    func switchDarkMode(to option: DarkModeViewCell.DarkModeOption) {
        for (index, darkModeOption) in darkModeOptions.enumerated() {
            let isSelected = darkModeOption == option
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) as? DarkModeViewCell {
                cell.switchControl.isOn = isSelected
            }
        }

        UserDefaults.standard.set(option.rawValue, forKey: "DarkModePreference")
        UserDefaults.standard.synchronize()

        switch option {
        case .enableDarkMode:
            setAppWideDarkMode(true)
        case .enableLightMode:
            setAppWideDarkMode(false)
        case .useSystemPreferences:
            setAppWideDarkMode(isSystemPreferenceEnabled())
        }
    }

    private func isSystemPreferenceEnabled() -> Bool {
        if #available(iOS 13.0, *) {
            return UIScreen.main.traitCollection.userInterfaceStyle == .dark
        } else {
            return false
        }
    }

    private func setAppWideDarkMode(_ enabled: Bool) {
        if enabled {
            // Set app-wide dark mode appearance here
            if let window = view.window {
                window.overrideUserInterfaceStyle = .dark
            }
        } else {
            // Set app-wide light mode appearance here
            if let window = view.window {
                window.overrideUserInterfaceStyle = .light
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return darkModeOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "darkCell", for: indexPath) as! DarkModeViewCell
        let option = darkModeOptions[indexPath.row]
        let savedPreference = UserDefaults.standard.integer(forKey: "DarkModePreference")
        cell.configure(with: option, isSelected: savedPreference == indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = darkModeOptions[indexPath.row]
        switchDarkMode(to: option)
    }
}
