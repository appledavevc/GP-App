//
//  ContactViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 25/07/2023.
//

import UIKit

class ContactViewController: UIViewController {
    // Outlet connections for the buttons
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var messengerButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var discordButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!

    // Links
    let facebookLink = "https://www.facebook.com/ghentphotographygp"
    let messengerLink = "http://m.me/ghentphotographygp"
    let instagramLink = "https://www.instagram.com/ghent_photography/"
    let discordLink = "https://discord.gg/jaYeKGvUr8"
    let emailLink = "mailto:hello@ghentphotography.be"
    let websiteLink = "https://www.ghentphotography.be"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up button targets
        facebookButton.addTarget(self, action: #selector(openFacebook), for: .touchUpInside)
        messengerButton.addTarget(self, action: #selector(openMessenger), for: .touchUpInside)
        instagramButton.addTarget(self, action: #selector(openInstagram), for: .touchUpInside)
        discordButton.addTarget(self, action: #selector(openDiscord), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(openEmail), for: .touchUpInside)
        websiteButton.addTarget(self, action: #selector(openWebsite), for: .touchUpInside)
    }

    // Function to open the links in Safari or respective apps
    @objc func openFacebook() {
        openLink(urlString: facebookLink)
    }

    @objc func openMessenger() {
        openLink(urlString: messengerLink)
    }

    @objc func openInstagram() {
        openLink(urlString: instagramLink)
    }

    @objc func openDiscord() {
        openLink(urlString: discordLink)
    }

    @objc func openEmail() {
        openLink(urlString: emailLink)
    }

    @objc func openWebsite() {
        openLink(urlString: websiteLink)
    }

    // Helper function to open links
    private func openLink(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

