//
//  PortraitViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 28/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class PortraitViewController: UICollectionViewController {
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems,
               let destinationController = segue.destination as? PortraitDetailViewController {
                destinationController.portrait = portrait[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var portrait: [Portrait] = [Portrait(image: "P1GrootBegijnhof", name: "Groot-Begijnhof", information: "Test\n\nPortrait"),
                                        Portrait(image: "P2SintAmandsberg", name: "Sint-Amandsberg", information: "Test"),
                                        Portrait(image: "P3Sint-Pieterskerk", name: "Sint-Pieterskerk", information: "Test"),
                                        Portrait(image: "P4Sint-Michielshelling", name: "Sint-Michielshelling", information: "Test"),
                                        Portrait(image: "P5GSP", name: "Gent-Sint-Pieters", information: "Test"),
                                        Portrait(image: "P6GSP", name: "Gent-Sint-Pieters", information: "Test"),
                                        Portrait(image: "P8Korenmarkt", name: "Korenmarkt", information: "Test"),
                                        Portrait(image: "P9Sint-Jacobs", name: "Sint-Jacobs", information: "Test"),
                                        Portrait(image: "P10Dok-Noord", name: "Dok-Noord", information: "Test"),
                                        Portrait(image: "P11Dampoort", name: "Antwerpenplein", information: "Test"),
                                        Portrait(image: "P12Dampoort", name: "Dampoort", information: "Test"),
                                        Portrait(image: "P13Belfort", name: "Belfort", information: "Test")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portrait.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! PortraitViewCell

        let portraitItem = portrait[indexPath.row]
        cell.portraitImageView.image = UIImage(named: portraitItem.image)
        cell.portraitNameLabel.text = portraitItem.name

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
