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

        // Add large title to the navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true

        // Set the content inset to center the cell when the view loads
        updateTableViewContentInset()
    }

    // Function to update the content inset based on the table view's content size
    private func updateTableViewContentInset() {
        let tableHeight = tableView.frame.height
        let contentHeight = tableView.contentSize.height

        if contentHeight < tableHeight {
            let extraSpace = tableHeight - contentHeight - (navigationController?.navigationBar.frame.height ?? 0)
            tableView.contentInset = UIEdgeInsets(top: extraSpace / 2, left: 0, bottom: extraSpace / 2, right: 0)
        } else {
            tableView.contentInset = .zero
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Adjust the content inset whenever the view layout changes (e.g., screen rotation)
        updateTableViewContentInset()
    }

    // Add viewWillTransition function to handle screen rotation for auto-alignment
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.updateTableViewContentInset()
        }, completion: nil)
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
        cell.descriptionLabel.text = "This is where we keep the most treasured photos."
        cell.vaultButton.setTitle("Enter The Vault", for: .normal)

        return cell
    }

    // MARK: - VaultTableViewCellDelegate

    func vaultButtonTapped(in cell: VaultTableViewCell) {
        // Animate the selected cell first
        animateCellAndPerformSegue(cell)
    }

    func animateCellAndPerformSegue(_ cell: VaultTableViewCell) {
        cell.animateIconImageView {
            // Perform the cross-fade animation and then transition to the VaultViewController
            UIView.transition(with: cell.iconImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                cell.iconImageView.image = UIImage(systemName: "lock.open.fill")
            }, completion: { _ in
                // Perform the segue after the fade-out animation is completed
                self.performSegue(withIdentifier: "showVault", sender: nil)
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
