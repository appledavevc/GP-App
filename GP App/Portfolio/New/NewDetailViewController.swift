//
//  NewDetailViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 27/07/2023.
//

import UIKit

class NewDetailViewController: UIViewController {

    var new: New?
       
       @IBOutlet var newImageView:UIImageView!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           newImageView.image = UIImage(named: new?.image ?? "")
           
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
