//
//  VaultTableViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

class VaultTableViewController: UITableViewController, VaultTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register custom cell
        tableView.register(VaultTableViewCell.self, forCellReuseIdentifier: "vaultCell")

        // Set automatic cell height calculation
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        // Remove separator lines
        tableView.separatorStyle = .none

        // Set the background color of the table view to match the system background color
        tableView.backgroundColor = UIColor.systemBackground

        // Enable vertical scrolling
        tableView.alwaysBounceVertical = true

        // Add large title to the navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Center the cell in the middle of the screen
        let tableViewHeight = tableView.bounds.size.height
        let contentHeight = tableView.contentSize.height
        let inset = max(0, (tableViewHeight - contentHeight) / 2)
        tableView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vaultCell", for: indexPath) as! VaultTableViewCell
        cell.delegate = self // Set the delegate for the cell

        // Configure the cell
        cell.titleLabel.text = "The Vault"
        cell.descriptionLabel.text = "Discover our app-exclusive portfolio here."
        cell.vaultButton.setTitle("Enter The Vault", for: .normal)

        return cell
    }

    // MARK: - VaultTableViewCellDelegate

    func vaultButtonTapped(in cell: VaultTableViewCell) {
        // Animate the selected cell first
        animateCellAndPresentVaultViewController(cell)
    }

    func animateCellAndPresentVaultViewController(_ cell: VaultTableViewCell) {
        cell.animateIconImageView {
            // Perform the cross-fade animation and then present the VaultViewController modally
            UIView.transition(with: cell.iconImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                cell.iconImageView.image = UIImage(systemName: "lock.open.fill")
            }, completion: { _ in
                // Instantiate the VaultViewController from storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let vaultViewController = storyboard.instantiateViewController(withIdentifier: "VaultViewController") as? VaultViewController {
                    self.present(vaultViewController, animated: true, completion: nil)
                }
            })
        }
    }

    // MARK: - Navigation

    // Prepare for segue (if needed)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVault" {
            // Implement any preparation for the segue if needed
        }
    }
}
