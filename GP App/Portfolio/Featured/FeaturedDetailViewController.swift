//
//  FeaturedDetailViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 24/07/2023.
//

import UIKit

class FeaturedDetailViewController: UIViewController {

    var featured: Featured?
       
       @IBOutlet var featuredImageView:UIImageView!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           featuredImageView.image = UIImage(named: featured?.image ?? "")
           
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
