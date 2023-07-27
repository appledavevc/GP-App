//
//  LandscapeDetailViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 27/07/2023.
//

import UIKit

class LandscapeDetailViewController: UIViewController {

    var landscape: Landscape?
       
       @IBOutlet var landscapeImageView:UIImageView!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           landscapeImageView.image = UIImage(named: landscape?.image ?? "")
           
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
