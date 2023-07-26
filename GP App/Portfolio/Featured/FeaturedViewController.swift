//
//  FeaturedViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 24/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class FeaturedViewController: UICollectionViewController {
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                let destinationController = segue.destination as! FeaturedDetailViewController
                destinationController.featured = featured[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var featured: [Featured] = [Featured(image: "F1Sint-Michielshelling", name: "Sint-Michielshelling"),
                                        Featured(image: "F2GSP", name: "Gent-Sint-Pieters"),
                                        Featured(image: "F3Dampoort", name: "Dampoort"),
                                        Featured(image: "F4GSP2", name: "Gent-Sint-Pieters"),
                                        Featured(image: "F5Korenmarkt", name: "Korenmarkt"),
                                        Featured(image: "F6Groot-Begijnhof", name: "Groot-Begijnhof"),
                                        Featured(image: "F7DokNoord", name: "Dok-Noord"),
                                        Featured(image: "F8Belfort", name: "Belfort"),
                                        Featured(image: "F9Dampoort", name: "Dampoort"),
                                        Featured(image: "F10Groot-Begijnhof", name: "Groot-Begijnhof")]

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
        return featured.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! FeaturedViewCell

        let featuredItem = featured[indexPath.row]
        cell.featuredImageView.image = UIImage(named: featuredItem.image)
        cell.featuredNameLabel.text = featuredItem.name

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

