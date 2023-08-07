//
//  VaultEntryParentViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

class VaultEntryParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Present the VaultTableViewController when the parent view controller appears
        let vaultTableViewController = VaultTableViewController()
        present(vaultTableViewController, animated: true, completion: nil)
    }
}
