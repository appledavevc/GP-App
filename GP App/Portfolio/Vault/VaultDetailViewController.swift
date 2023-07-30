//
//  VaultDetailViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

class VaultDetailViewController: UIViewController {

    var vault: Vault?
    
    @IBOutlet var vaultImageView: UIImageView!
    @IBOutlet var vaultNameLabel: UILabel!
    @IBOutlet var moreInfoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vaultImageView.image = UIImage(named: vault?.image ?? "")

        // Add target action to the "More info" button
        moreInfoButton.addTarget(self, action: #selector(showInformation), for: .touchUpInside)
    }
    
    @objc func showInformation() {
        let information = vault?.information ?? "No additional information available."

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        var fontColor: UIColor
        if traitCollection.userInterfaceStyle == .dark {
            // Dark mode is enabled, set font color to white
            fontColor = .white
        } else {
            // Light mode is enabled, set font color to black
            fontColor = .black
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: fontColor,
            .paragraphStyle: paragraphStyle
        ]

        let attributedText = NSAttributedString(string: information, attributes: attributes)

        let alertController = UIAlertController(title: "Photo information", message: "", preferredStyle: .alert)
        alertController.setValue(attributedText, forKey: "attributedMessage")

        alertController.addAction(UIAlertAction(title: "Interesting", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // Add traitCollectionDidChange method to update the font color when appearance mode changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Update the UIAlertController message text color when appearance mode changes
        if let alertController = presentedViewController as? UIAlertController {
            var fontColor: UIColor
            if traitCollection.userInterfaceStyle == .dark {
                fontColor = .white
            } else {
                fontColor = .black
            }
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: fontColor,
                .paragraphStyle: NSMutableParagraphStyle()
            ]
            
            let attributedText = NSAttributedString(string: alertController.message ?? "", attributes: attributes)
            alertController.setValue(attributedText, forKey: "attributedMessage")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
