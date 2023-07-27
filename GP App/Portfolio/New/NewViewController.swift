//
//  NewViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 27/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewViewController: UICollectionViewController {
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                let destinationController = segue.destination as! NewDetailViewController
                destinationController.new = new[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var new: [New] = [New(image: "N1OudeDokken", name: "Elektriciteitscentrale"),
                                        New(image: "N2OudeDokken", name: "Bataviabrug"),
                                        New(image: "N3OudeDokken", name: "Schipperskaai"),
                                        New(image: "N4OudeDokken", name: "Koopvaardijlaan"),
                                        New(image: "N5OudeDokken", name: "Dampoort"),
                                        New(image: "N6OudeDokken", name: "Dok-Noord"),
                                        New(image: "N7OudeDokken", name: "Bataviabrug"),
                                        New(image: "N8OudeDokken", name: "Bataviapad"),
                                        New(image: "N9OudeDokken", name: "Koopvaardijlaan"),
                                        New(image: "N16Groot-Begijnhof", name: "Groot-Begijnhof"),
                                        New(image: "N17SintAmandsberg", name: "Sint-Amandsberg"),
                                        New(image: "N18Groot-Begijnhof", name: "Groot-Begijnhof"),
                                        New(image: "N15Sint-Pieterskerk", name: "Sint-Pieterskerk"),
                                        New(image: "N14Sint-Michielshelling", name: "Sint-Michielshelling"),
                                        New(image: "N13GSP", name: "Gent-Sint-Pieters"),
                                        New(image: "N12GSP", name: "Gent-Sint-Pieters"),
                                        New(image: "N11Groot-Begijnhof", name: "Groot-Begijnhof"),
                                        New(image: "N10Korenmarkt", name: "Korenmarkt")]

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
        return new.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! NewViewCell

        let newItem = new[indexPath.row]
        cell.newImageView.image = UIImage(named: newItem.image)
        cell.newNameLabel.text = newItem.name

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
