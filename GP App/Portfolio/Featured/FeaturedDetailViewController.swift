//
//  FeaturedDetailViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 24/07/2023.
//

import UIKit

class FeaturedDetailViewController: UIViewController {
    
    var featured: Featured?
    
    @IBOutlet var featuredImageView: UIImageView!
    @IBOutlet var featuredNameLabel: UILabel!
    @IBOutlet var moreInfoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredImageView.image = UIImage(named: featured?.image ?? "")

        // Add target action to the "More info" button
        moreInfoButton.addTarget(self, action: #selector(showInformation), for: .touchUpInside)
    }
    
    @objc func showInformation() {
        let information = featured?.information ?? "No additional information available."

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]

        let attributedText = NSAttributedString(string: information, attributes: attributes)

        let alertController = UIAlertController(title: "More about this photo", message: "", preferredStyle: .alert)
        alertController.setValue(attributedText, forKey: "attributedMessage")

        alertController.addAction(UIAlertAction(title: "Interesting", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
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
