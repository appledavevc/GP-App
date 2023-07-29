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
            if let indexPaths = collectionView.indexPathsForSelectedItems,
               let destinationController = segue.destination as? FeaturedDetailViewController {
                destinationController.featured = featured[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var featured: [Featured] = [Featured(image: "F1Sint-Michielshelling", name: "Sint-Michielshelling", information: "11/03/2023 - 16u24\n\nThe Saint Michael's Bridge is a stone arch bridge located in the center of the Belgian city of Ghent. The bridge spans the River Leie, on the south side of the Graslei and Korenlei. The current monumental bridge was built between 1905 and 1909, following the construction of the post office building.\n\nBoth the Saint Michael's Bridge and the Old Post Office are creations of the architect Louis Cloquet."),
                                        Featured(image: "F2GSP", name: "Gent-Sint-Pieters", information: "30/01/2023 - 09u47\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                        Featured(image: "F3Dampoort", name: "Dampoort", information: "27/01/2022 - 06u23\n\nDampoort is a neighbourhood in the city of Ghent in Belgium.\n\nNowadays it is mainly known as the location of the railway station Gent-Dampoort and its major crossroads to including but not limited to the city ring R40, Antwerp and the port.\n\nIn former times it used to be the eastern gate of the city, it opened the city towards the region of Waasland (or Land van Waas) and Antwerp."),
                                        Featured(image: "F4GSP2", name: "Gent-Sint-Pieters", information: "Test"),
                                        Featured(image: "F5Korenmarkt", name: "Korenmarkt", information: "Test"),
                                        Featured(image: "F6Groot-Begijnhof", name: "Groot-Begijnhof", information: "Test"),
                                        Featured(image: "F7DokNoord", name: "Dok-Noord", information: "Test"),
                                        Featured(image: "F8Belfort", name: "Belfort", information: "Test"),
                                        Featured(image: "F9Dampoort", name: "Dampoort", information: "Test"),
                                        Featured(image: "F10Groot-Begijnhof", name: "Groot-Begijnhof", information: "Test"),
                                        Featured(image: "F11OudeDokken", name: "Oude Dokken", information: "Test"),
                                        Featured(image: "F12OudeDokken", name: "Oude Dokken", information: "Test"),
                                        Featured(image: "F13SintAmandsberg", name: "Sint-Amandsberg", information: "Test"),
                                        Featured(image: "F14GSP", name: "Gent-Sint-Pieters", information: "Test")]

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
