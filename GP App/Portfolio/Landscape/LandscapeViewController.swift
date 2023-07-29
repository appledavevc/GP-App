//
//  LandscapeViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 27/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class LandscapeViewController: UICollectionViewController {
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                let destinationController = segue.destination as! LandscapeDetailViewController
                destinationController.landscape = landscape[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var landscape: [Landscape] = [Landscape(image: "L22Azaleapark", name: "Azaleapark"),
                                          Landscape(image: "L10Dampoort", name: "Gent-Dampoort"),
                                          Landscape(image: "L11GSP", name: "Gent-Sint-Pieters"),
                                          Landscape(image: "L12GSP", name: "Heritage PCC tram"),
                                          Landscape(image: "L13Korenmarkt", name: "Korenmarkt by night"),
                                          Landscape(image: "L14Graslei", name: "Graslei"),
                                          Landscape(image: "L15GSP", name: "Gent-Sint-Pieters"),
                                          Landscape(image: "L16GSP", name: "Gent-Sint-Pieters"),
                                          Landscape(image: "L17GrootBegijnhof", name: "Groot-Begijnhof"),
                                          Landscape(image: "L18Tweebruggen", name: "Tweebruggen"),
                                          Landscape(image: "L19Houtdok", name: "Houtdok"),
                                          Landscape(image: "L20Houtdok", name: "Houtdok"),
                                          Landscape(image: "L21Houtdok", name: "Houtdok"),
                                          Landscape(image: "L24GSP", name: "Gent-Sint-Pieters"),
                                          Landscape(image: "L1OudeDokken", name: "Power plant"),
                                          Landscape(image: "L2OudeDokken", name: "Bataviabrug"),
                                          Landscape(image: "L3OudeDokken", name: "Schipperskaai"),
                                          Landscape(image: "L4OudeDokken", name: "Koopvaardijlaan"),
                                          Landscape(image: "L5OudeDokken", name: "Dampoort"),
                                          Landscape(image: "L6OudeDokken", name: "Dok-Noord"),
                                          Landscape(image: "L7OudeDokken", name: "Bataviabrug"),
                                          Landscape(image: "L8OudeDokken", name: "Bataviapad"),
                                          Landscape(image: "L9OudeDokken", name: "Koopvaardijlaan"),
                                          Landscape(image: "L23OudeDokken", name: "Kleindokkaai")]
                                        
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
        return landscape.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! LandscapeViewCell

        let landscapeItem = landscape[indexPath.row]
        cell.landscapeImageView.image = UIImage(named: landscapeItem.image)
        cell.landscapeNameLabel.text = landscapeItem.name

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
