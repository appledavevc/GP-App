//
//  DarkModeViewCell.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 03/08/2023.
//

import UIKit

class DarkModeTableViewCell: UITableViewCell {

    static let reuseIdentifier = "DarkModeTableViewCell"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return switchControl
    }()

    var switchValueChanged: ((Bool) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchControl)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    @objc private func switchValueChanged(_ sender: UISwitch) {
        switchValueChanged?(sender.isOn)
    }
}

