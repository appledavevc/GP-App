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
            if let indexPaths = collectionView.indexPathsForSelectedItems,
               let destinationController = segue.destination as? LandscapeDetailViewController {
                destinationController.landscape = landscape[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var landscape: [Landscape] = [Landscape(image: "L22Azaleapark", name: "Azaleapark", information: "Test\n\nLandscape"),
                                          Landscape(image: "L10Dampoort", name: "Gent-Dampoort", information: "Test"),
                                          Landscape(image: "L11GSP", name: "Gent-Sint-Pieters", information: "15/02/2013 - 19u34\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L12GSP", name: "Heritage PCC tram", information: "Test"),
                                          Landscape(image: "L13Korenmarkt", name: "Korenmarkt by night", information: "Test"),
                                          Landscape(image: "L14Graslei", name: "Graslei", information: "Test"),
                                          Landscape(image: "L15GSP", name: "Gent-Sint-Pieters", information: "05/05/2021 - 5u15\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L16GSP", name: "Gent-Sint-Pieters", information: "13/05/2021 - 21u55\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L17GrootBegijnhof", name: "Groot-Begijnhof", information: "Test"),
                                          Landscape(image: "L18Tweebruggen", name: "Tweebruggen", information: "Test"),
                                          Landscape(image: "L19Houtdok", name: "Houtdok", information: "Test"),
                                          Landscape(image: "L20Houtdok", name: "Houtdok", information: "Test"),
                                          Landscape(image: "L21Houtdok", name: "Houtdok", information: "Test"),
                                          Landscape(image: "L24GSP", name: "Gent-Sint-Pieters", information: "04/02/2023 - 18u31\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L1OudeDokken", name: "Power plant", information: "Test"),
                                          Landscape(image: "L2OudeDokken", name: "Bataviabrug", information: "Test"),
                                          Landscape(image: "L3OudeDokken", name: "Schipperskaai", information: "Test"),
                                          Landscape(image: "L4OudeDokken", name: "Koopvaardijlaan", information: "Test"),
                                          Landscape(image: "L5OudeDokken", name: "Dampoort", information: "Test"),
                                          Landscape(image: "L6OudeDokken", name: "Dok-Noord", information: "Test"),
                                          Landscape(image: "L7OudeDokken", name: "Bataviabrug", information: "Test"),
                                          Landscape(image: "L8OudeDokken", name: "Bataviapad", information: "Test"),
                                          Landscape(image: "L9OudeDokken", name: "Koopvaardijlaan", information: "Test"),
                                          Landscape(image: "L23OudeDokken", name: "Kleindokkaai", information: "Test"),
                                          Landscape(image: "L25GrootBegijnhof", name: "Groot-Begijnhof", information: "24/05/2023 - 15u49\n\nIn 1872, Duke Engelbertus van Arenberg purchased the northwestern part of Sint-Baafskouter in Sint-Amandsberg, measuring 8 hectares, known as Nieuwhofkouter. The intention was to construct a new beguinage on this land for the beguines expelled by the Commission of the Civil Godshuizen from the confiscated Groot or Sint-Elisabethbeguinage in Ghent, which was founded in 1234.\n\nIn 1873, construction of the beguinage commenced based on the design by architect Arthur Verhaegen.\n\nThe beguinage was entirely planned in the style of medieval beguinages, resembling a walled city within a city, inspired by the Flemish Gothic architecture of the 15th century.\n\nIt extends over a rectangular southwest-northeast oriented site, with the main entrance located on the northeastern side at the end of Jan Roomsstraat, and the back entrance facing Engelbert Van Arenbergstraat on the southwestern side.\n\nAt the center and diagonally on this site lies an east-west oriented 'dries' (a central green area) with the church; opposite the west facade of the church stands the Groothuis, along with the infirmary and the chapel of Saint Anthony of Padua.\n\nThe beguinage comprises three squares: Sint-Elisabethplein between the church and the Groothuis, Sint-Beggaplein behind the church, and Sint-Antoniusplein in front of the rear exit. The first and second squares feature a grassy area, serving as a pasture, bordered with trees and wrought-iron fencing.\n\nEight streets provide straight and winding connections to the central 'dries' from the entrances: Arenbergstraat, Heilige Amandusstraat, Heilige Bavostraat, Heilige Livinusstraat, Puis IX-straat, Calvariebergstraat, Onze-Lieve-Vrouwstraat, and Heilige Kruisstraat.\n\nThe beguinage, consisting of fourteen convents for around thirty beguines and eighty houses, was inaugurated on September 29, 1874.\n\nInfo source: Inventaris Onroerend Erfgoed: Groot Begijnhof, https://id.erfgoed.net/erfgoedobjecten/122162 (consulted on 5 August 2023).")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register the XIB file for the cell
        collectionView.register(UINib(nibName: "LandscapeViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Set the spacing between cells (adjust the constants as needed)
        let spacing: CGFloat = 12
        let collectionViewFlowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewFlowLayout?.minimumLineSpacing = spacing
        collectionViewFlowLayout?.minimumInteritemSpacing = spacing
        collectionViewFlowLayout?.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 10, right: 15)
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
