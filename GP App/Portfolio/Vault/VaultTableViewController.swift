//
//  VaultTableViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

class VaultTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register custom cell
        tableView.register(VaultTableViewCell.self, forCellReuseIdentifier: "vaultCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vaultCell", for: indexPath) as! VaultTableViewCell

        // Configure the cell
        cell.titleLabel.text = "The Vault"
        cell.descriptionLabel.text = "This is where we keep the most treasured photos."
        cell.vaultButton.setTitle("Open Vault", for: .normal)
        cell.vaultButton.addTarget(self, action: #selector(openVaultButtonTapped), for: .touchUpInside)

        return cell
    }

    @objc func openVaultButtonTapped() {
        // Handle opening the vault, e.g., navigate to the VaultCollectionViewController
        // Implement your navigation logic here
        print("Open the Vault!")
    }
}
