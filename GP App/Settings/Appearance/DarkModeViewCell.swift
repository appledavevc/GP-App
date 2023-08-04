//
//  DarkModeViewCell.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 04/08/2023.
//

import UIKit

class DarkModeViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!

    enum DarkModeOption: Int {
        case enableDarkMode
        case enableLightMode
        case useSystemPreferences

        var title: String {
            switch self {
            case .enableDarkMode: return "Enable Dark Mode"
            case .enableLightMode: return "Enable Light Mode"
            case .useSystemPreferences: return "Use System Preferences"
            }
        }

        var icon: UIImage? {
            switch self {
            case .enableDarkMode: return UIImage(systemName: "moon.fill")
            case .enableLightMode: return UIImage(systemName: "sun.max.fill")
            case .useSystemPreferences: return nil
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }

    private func setupConstraints() {
        // IconImageView constraints
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor).isActive = true

        // modeLabel constraints
        modeLabel.translatesAutoresizingMaskIntoConstraints = false
        modeLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        modeLabel.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: -16).isActive = true
        modeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        // switchControl constraints
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    func configure(with option: DarkModeOption, isSelected: Bool) {
        iconImageView.image = option.icon
        modeLabel.text = option.title
        switchControl.isOn = isSelected
    }
}
