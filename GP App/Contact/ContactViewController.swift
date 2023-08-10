//
//  ContactViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 10/08/2023.
//

import UIKit

class ContactViewController: UITableViewController {

    let sections = ["Our socials", "Discord", "GitHub", "E-mail"]
    let socialOptions = ["Facebook", "Messenger", "Instagram"]
    let discordOptions = ["Ghent Photography"]
    let githubOptions = ["GP App"]
    let emailOptions = ["hello@ghentphotography.be"]

    private var hasPerformedExplosionAnimation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Let's Connect"
        
        tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return socialOptions.count
        case 1:
            return discordOptions.count
        case 2:
            return githubOptions.count
        case 3:
            return emailOptions.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactViewCell(style: .default, reuseIdentifier: "ContactViewCell")
        
        switch indexPath.section {
        case 0:
            cell.configure(iconImage: UIImage(systemName: "bell.badge.fill"), title: socialOptions[indexPath.row])
        case 1:
            if let image = UIImage(systemName: "paperplane.fill") {
                cell.configure(iconImage: image, title: discordOptions[indexPath.row])
            }
        case 2:
            if let image = UIImage(systemName: "arrow.right.square.fill") {
                cell.configure(iconImage: image, title: githubOptions[indexPath.row])
            }
        case 3:
            if let image = UIImage(systemName: "envelope.fill") {
                cell.configure(iconImage: image, title: emailOptions[indexPath.row])
            }
        default:
            break
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.section == 1 && indexPath.row == 0 {
            if let url = URL(string: "https://discord.gg/jaYeKGvUr8") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else if indexPath.section == 2 && indexPath.row == 0 {
            if let url = URL(string: "https://github.com/appledavevc/GP-App") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else if indexPath.section == 3 && indexPath.row == 0 {
            if let url = URL(string: "mailto:hello@ghentphotography.be") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
