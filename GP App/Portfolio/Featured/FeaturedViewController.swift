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
                                        Featured(image: "F3Dampoort", name: "Antwerpenplein", information: "27/01/2022 - 06u23\n\nDampoort is a neighbourhood in the city of Ghent in Belgium.\n\nNowadays it is mainly known as the location of the railway station Gent-Dampoort and its major crossroads to including but not limited to the city ring R40, Antwerp and the port.\n\nIn former times it used to be the eastern gate of the city, it opened the city towards the region of Waasland (or Land van Waas) and Antwerp."),
                                        Featured(image: "F4GSP2", name: "Gent-Sint-Pieters", information: "03/02/2023 - 18u00\n\nWhere the postal building (Gent X) once stood, the first part of a brand-new bus station has already replaced the postal building.\n\nOnce completed, this bus station with 12 platforms currently accommodates 24 articulated buses.\n\nIt has been designed to facilitate quick and comfortable transfers between trams and trains.\n\nIn the future, the 12 platforms will be extended to allow two articulated buses to stop at each platform.\n\nAdditionally, the canopy will also double in length."),
                                        Featured(image: "F5Korenmarkt", name: "Cataloniëstraat", information: "03/01/2023 - 17u33\n\nOriginally, this narrow street led from the former Kleine Koornmarkt and the south side of the St. Nicholas' Church to the Belfry. It was historically known as Cattesteghe.\n\nThe street played a significant role near the St. Nicholas' Church and had two alleys on its south side: the Heilige Geeststraatje and the Kromsteghe. In the late 19th century, it was widened and renamed Sint-Niklaasstraat.\n\nAlong this street, there were four businesses: the house of roof tilers and cheese merchants between the Heilige Geeststraatje and the Kromsteeg, the house of masons on the corner of Kromsteeg, whose front facade was demolished in 1852 but rebuilt on the Graslei for the 1913 World Exhibition.\n\nLastly, there was the house of carpenters, which was demolished at the end of the 19th century. In 1834-1835, the street was widened under the mayor Van Crombrugge, resulting in the demolition of the northern section.\n\nIn the early 20th century, the houses on the southeast and southwest sides of the Sint-Niklaaskerk were demolished as part of urban development works under the mayor Braun."),
                                        Featured(image: "F6Groot-Begijnhof", name: "Groot-Begijnhof", information: "Test"),
                                        Featured(image: "F7DokNoord", name: "Dok-Noord", information: "Test"),
                                        Featured(image: "F8Belfort", name: "Belfort", information: "Test"),
                                        Featured(image: "F9Dampoort", name: "Dampoort", information: "Test"),
                                        Featured(image: "F10Groot-Begijnhof", name: "Groot-Begijnhof", information: "Test"),
                                        Featured(image: "F11OudeDokken", name: "Power plant", information: "Test"),
                                        Featured(image: "F12OudeDokken", name: "Bataviabrug", information: "Test"),
                                        Featured(image: "F13SintAmandsberg", name: "Sint-Amandsberg", information: "Test"),
                                        Featured(image: "F14GSP", name: "Gent-Sint-Pieters", information: "Test")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register the XIB file for the cell
        collectionView.register(UINib(nibName: "FeaturedViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

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
