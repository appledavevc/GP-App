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
        cell.vaultButton.setTitle("Open The Vault", for: .normal)
        cell.vaultButton.addTarget(self, action: #selector(openVaultButtonTapped), for: .touchUpInside)

        return cell
    }

    @objc func openVaultButtonTapped() {
        // Perform the segue programmatically using the identifier you set in the storyboard
        performSegue(withIdentifier: "showVault", sender: nil)
    }

    // MARK: - Navigation

    // Prepare for segue (if needed)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVault" {
            // Implement any preparation for the segue if needed
        }
    }
}

