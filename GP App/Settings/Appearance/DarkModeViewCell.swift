//
//  DarkModeViewCell.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 03/08/2023.
//

import UIKit

class DarkModeViewCell: UITableViewCell {

    static let reuseIdentifier = "darkmodeCell"

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!

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
        // No need to add subviews or constraints here as they are already connected via IBOutlets
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        switchValueChanged?(sender.isOn)
    }
}
