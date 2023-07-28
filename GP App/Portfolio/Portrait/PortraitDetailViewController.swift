//
//  PortraitDetailViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 28/07/2023.
//

import UIKit

class PortraitDetailViewController: UIViewController {

    var portrait: Portrait?
       
       @IBOutlet var portraitImageView:UIImageView!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           portraitImageView.image = UIImage(named: portrait?.image ?? "")
           
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
