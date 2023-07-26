//
//  ContactViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 25/07/2023.
//

import UIKit
import AVFoundation

class ContactViewController: UIViewController {

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var messengerButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var discordButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var githubButton: UIButton!

    let facebookLink = "https://www.facebook.com/ghentphotographygp"
    let messengerLink = "https://m.me/ghentphotographygp"
    let instagramLink = "https://www.instagram.com/ghent_photography/"
    let discordLink = "https://discord.gg/jaYeKGvUr8"
    let emailLink = "mailto:hello@ghentphotography.be"
    let githubLink = "https://github.com/appledavevc/GP-App"

    var tapSoundPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set font for buttons using preferred headline style
        facebookButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        messengerButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        instagramButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        discordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        emailButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        githubButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)

        // Load the tap sound from the file (e.g., "shuttersound.wav")
        if let soundURL = Bundle.main.url(forResource: "shuttersound", withExtension: "wav") {
            do {
                tapSoundPlayer = try AVAudioPlayer(contentsOf: soundURL)
                tapSoundPlayer?.prepareToPlay()
            } catch {
                print("Error loading tap sound: \(error)")
            }
        }

        facebookButton.addTarget(self, action: #selector(openFacebook), for: .touchUpInside)
        messengerButton.addTarget(self, action: #selector(openMessenger), for: .touchUpInside)
        instagramButton.addTarget(self, action: #selector(openInstagram), for: .touchUpInside)
        discordButton.addTarget(self, action: #selector(openDiscord), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(openEmail), for: .touchUpInside)
        githubButton.addTarget(self, action: #selector(openGitHub), for: .touchUpInside)

        // Listen for content size category changes to update fonts dynamically
        NotificationCenter.default.addObserver(self, selector: #selector(handleContentSizeChange), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    @objc func handleContentSizeChange() {
        // Update fonts when content size category changes
        facebookButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        messengerButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        instagramButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        discordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        emailButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        githubButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    // Don't forget to remove the observer when the view controller is deallocated
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    @objc func openFacebook() {
        if let facebookURL = URL(string: "fb://profile/ghentphotographygp") {
            if UIApplication.shared.canOpenURL(facebookURL) {
                tapSoundPlayer?.play()
                UIApplication.shared.open(facebookURL, options: [:], completionHandler: nil)
            } else {
                openLink(urlString: facebookLink)
            }
        } else {
            openLink(urlString: facebookLink)
        }
    }

    @objc func openMessenger() {
        if let messengerURL = URL(string: "fb-messenger://user-thread/ghentphotographygp") {
            if UIApplication.shared.canOpenURL(messengerURL) {
                tapSoundPlayer?.play()
                UIApplication.shared.open(messengerURL, options: [:], completionHandler: nil)
            } else {
                openLink(urlString: messengerLink)
            }
        } else {
            openLink(urlString: messengerLink)
        }
    }

    @objc func openInstagram() {
        if let instagramURL = URL(string: "instagram://user?username=ghent_photography") {
            if UIApplication.shared.canOpenURL(instagramURL) {
                tapSoundPlayer?.play()
                UIApplication.shared.open(instagramURL, options: [:], completionHandler: nil)
            } else {
                openLink(urlString: instagramLink)
            }
        } else {
            openLink(urlString: instagramLink)
        }
    }

    @objc func openDiscord() {
        tapSoundPlayer?.play()
        openLink(urlString: discordLink)
    }

    @objc func openEmail() {
        tapSoundPlayer?.play()
        openLink(urlString: emailLink)
    }

    @objc func openGitHub() {
        tapSoundPlayer?.play()
        openLink(urlString: githubLink)
    }

    private func openLink(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}




