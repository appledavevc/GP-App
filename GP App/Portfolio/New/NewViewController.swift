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
            if let indexPaths = collectionView.indexPathsForSelectedItems,
               let destinationController = segue.destination as? NewDetailViewController {
                destinationController.new = new[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var new: [New] = [New(image: "N1OudeDokken", name: "Power Plant", information: "25/07/2023 - 21u22\n\nThe power plant was built in the 1920s in the centre of Ghent, close to Dampoort.\n\nUnder the direction of the City of Ghent, construction of the diesel hall began in the late 1960s. Since then, the tall chimney of this building has become a distinctive feature of the Ghent skyline.\n\nAfter the Ham power plant was integrated into the production park of EDF Luminus and connected to the national grid, the diesel generators gradually served more as peak power plants, operating for a limited number of hours in emergencies.\n\nIn 1993, the coal-fired units were demolished and replaced by a combined cycle unit (STEG unit).\n\nThirteen years later, two additional peak units powered by natural gas were put into service.\n\nIn 2006, two diesel generators were demolished, while the third one remained operational as an emergency unit during renovation works. It was taken out of service upon the inauguration of the new gas turbines.\n\nInfo source: Gent-Geprent"),
                              New(image: "N2OudeDokken", name: "Bataviabrug", information: "25/07/2023 - 21u22\n\nThe power plant was built in the 1920s in the centre of Ghent, close to Dampoort.\n\nUnder the direction of the City of Ghent, construction of the diesel hall began in the late 1960s. Since then, the tall chimney of this building has become a distinctive feature of the Ghent skyline.\n\nAfter the Ham power plant was integrated into the production park of EDF Luminus and connected to the national grid, the diesel generators gradually served more as peak power plants, operating for a limited number of hours in emergencies.\n\nIn 1993, the coal-fired units were demolished and replaced by a combined cycle unit (STEG unit).\n\nThirteen years later, two additional peak units powered by natural gas were put into service.\n\nIn 2006, two diesel generators were demolished, while the third one remained operational as an emergency unit during renovation works. It was taken out of service upon the inauguration of the new gas turbines.\n\nInfo source: Gent-Geprent"),
                              New(image: "N3OudeDokken", name: "Schipperskaai", information: "25/07/2023 - 21u04"),
                              New(image: "N4OudeDokken", name: "Koopvaardijlaan", information: "25/07/2023 - 21u17"),
                              New(image: "N5OudeDokken", name: "Dampoort", information: "25/07/2023 - 21u27"),
                              New(image: "N6OudeDokken", name: "Dok-Noord", information: "25/07/2023 - 21u09"),
                              New(image: "N7OudeDokken", name: "Bataviabrug", information: "25/07/2023 - 21u12"),
                              New(image: "N8OudeDokken", name: "Bataviapad", information: "27/07/2023 - 21u14"),
                              New(image: "N9OudeDokken", name: "Koopvaardijlaan", information: "25/07/2023 - 21u21"),
                              New(image: "N16Groot-Begijnhof", name: "Groot-Begijnhof", information: "13/07/2023 - 15u21\n\nIn 1872, Duke Engelbertus van Arenberg purchased the northwestern part of Sint-Baafskouter in Sint-Amandsberg, measuring 8 hectares, known as Nieuwhofkouter. The intention was to construct a new beguinage on this land for the beguines expelled by the Commission of the Civil Godshuizen from the confiscated Groot or Sint-Elisabethbeguinage in Ghent, which was founded in 1234.\n\nIn 1873, construction of the beguinage commenced based on the design by architect Arthur Verhaegen.\n\nThe beguinage was entirely planned in the style of medieval beguinages, resembling a walled city within a city, inspired by the Flemish Gothic architecture of the 15th century.\n\nIt extends over a rectangular southwest-northeast oriented site, with the main entrance located on the northeastern side at the end of Jan Roomsstraat, and the back entrance facing Engelbert Van Arenbergstraat on the southwestern side.\n\nAt the center and diagonally on this site lies an east-west oriented 'dries' (a central green area) with the church; opposite the west facade of the church stands the Groothuis, along with the infirmary and the chapel of Saint Anthony of Padua.\n\nThe beguinage comprises three squares: Sint-Elisabethplein between the church and the Groothuis, Sint-Beggaplein behind the church, and Sint-Antoniusplein in front of the rear exit. The first and second squares feature a grassy area, serving as a pasture, bordered with trees and wrought-iron fencing.\n\nEight streets provide straight and winding connections to the central 'dries' from the entrances: Arenbergstraat, Heilige Amandusstraat, Heilige Bavostraat, Heilige Livinusstraat, Puis IX-straat, Calvariebergstraat, Onze-Lieve-Vrouwstraat, and Heilige Kruisstraat.\n\nThe beguinage, consisting of fourteen convents for around thirty beguines and eighty houses, was inaugurated on September 29, 1874.\n\nInfo source: Inventaris Onroerend Erfgoed: Groot Begijnhof, https://id.erfgoed.net/erfgoedobjecten/122162 (consulted on 5 August 2023)."),
                              New(image: "N17SintAmandsberg", name: "Sint-Amandsberg", information: "05/07/2023 - 21u40\n\nThe old town hall is a neo-gothic building located on Antwerpsesteenweg in Sint-Amandsberg. Construction began in 1880 and was completed in 1883. In 1976, the services were moved to the current service center, just before the merger with Ghent.\n\nSince the French era, Oostakker and Sint-Amandsberg were part of the same parish. Under the initiative of Pastor Van Damme, a new parish was established for Sint-Amandsberg in 1848.\n\nThis parish, known as the Heilig-Hartparochie, promoted the development of a local identity.\n\nDue to the increasing population in Sint-Amandsberg, a petition was filed in 1868 requesting independence. One of the reasons was the long distance to the town hall in Oostakker.\n\nThe final independence was achieved in 1872."),
                              New(image: "N18Groot-Begijnhof", name: "Groot-Begijnhof", information: "24/05/2023 - 15u49\n\nIn 1872, Duke Engelbertus van Arenberg purchased the northwestern part of Sint-Baafskouter in Sint-Amandsberg, measuring 8 hectares, known as Nieuwhofkouter. The intention was to construct a new beguinage on this land for the beguines expelled by the Commission of the Civil Godshuizen from the confiscated Groot or Sint-Elisabethbeguinage in Ghent, which was founded in 1234.\n\nIn 1873, construction of the beguinage commenced based on the design by architect Arthur Verhaegen.\n\nThe beguinage was entirely planned in the style of medieval beguinages, resembling a walled city within a city, inspired by the Flemish Gothic architecture of the 15th century.\n\nIt extends over a rectangular southwest-northeast oriented site, with the main entrance located on the northeastern side at the end of Jan Roomsstraat, and the back entrance facing Engelbert Van Arenbergstraat on the southwestern side.\n\nAt the center and diagonally on this site lies an east-west oriented 'dries' (a central green area) with the church; opposite the west facade of the church stands the Groothuis, along with the infirmary and the chapel of Saint Anthony of Padua.\n\nThe beguinage comprises three squares: Sint-Elisabethplein between the church and the Groothuis, Sint-Beggaplein behind the church, and Sint-Antoniusplein in front of the rear exit. The first and second squares feature a grassy area, serving as a pasture, bordered with trees and wrought-iron fencing.\n\nEight streets provide straight and winding connections to the central 'dries' from the entrances: Arenbergstraat, Heilige Amandusstraat, Heilige Bavostraat, Heilige Livinusstraat, Puis IX-straat, Calvariebergstraat, Onze-Lieve-Vrouwstraat, and Heilige Kruisstraat.\n\nThe beguinage, consisting of fourteen convents for around thirty beguines and eighty houses, was inaugurated on September 29, 1874.\n\nInfo source: Inventaris Onroerend Erfgoed: Groot Begijnhof, https://id.erfgoed.net/erfgoedobjecten/122162 (consulted on 5 August 2023)."),
                              New(image: "N15Sint-Pieterskerk", name: "Sint-Pieterskerk", information: "15/04/2023 - 16u26"),
                              New(image: "N14Sint-Michielshelling", name: "Sint-Michielshelling", information: "11/03/2023 - 16u24\n\nThe Saint Michael's Bridge is a stone arch bridge located in the center of the Belgian city of Ghent.\n\nThe bridge spans the River Leie, on the south side of the Graslei and Korenlei.\n\nThe current monumental bridge was built between 1905 and 1909, following the construction of the post office building.\n\nBoth the Saint Michael's Bridge and the Old Post Office are creations of the architect Louis Cloquet."),
                              New(image: "N13GSP", name: "Gent-Sint-Pieters", information: "03/02/2023 - 18u00\n\nIn the very spot where the postal building (Gent X) once stood, a brand-new bus station is now taking shape, with the first part already replacing the former structure.\n\nUpon completion, this bus station will offer 12 platforms, providing ample space for accommodating 24 articulated buses, already operational at the moment.\n\nDesigned with a focus on passenger convenience, the station ensures swift and comfortable transfers between trams and trains, streamlining your travel experience.\n\nLooking ahead, enhancements are planned: The 12 existing platforms will be extended to allow two articulated buses to service each platform, maximizing efficiency.\n\nAnd there's more! The canopy will undergo a doubling in length, offering even better shelter and protection for passengers."),
                              New(image: "N12GSP", name: "Gent-Sint-Pieters", information: "30/01/2023 - 09u47\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                              New(image: "N11Groot-Begijnhof", name: "Groot-Begijnhof", information: "17/01/2023 - 16u43"),
                              New(image: "N10Korenmarkt", name: "Cataloniëstraat", information: "03/01/2023 - 17u33\n\nOriginally, this narrow street led from the former Kleine Koornmarkt and the south side of the St. Nicholas' Church to the Belfry. It was historically known as Cattesteghe.\n\nThe street played a significant role near the St. Nicholas' Church and had two alleys on its south side: the Heilige Geeststraatje and the Kromsteghe. In the late 19th century, it was widened and renamed Sint-Niklaasstraat.\n\nAlong this street, there were four businesses: the house of roof tilers and cheese merchants between the Heilige Geeststraatje and the Kromsteeg, the house of masons on the corner of Kromsteeg, whose front facade was demolished in 1852 but rebuilt on the Graslei for the 1913 World Exhibition.\n\nLastly, there was the house of carpenters, which was demolished at the end of the 19th century. In 1834-1835, the street was widened under the mayor Van Crombrugge, resulting in the demolition of the northern section.\n\nIn the early 20th century, the houses on the southeast and southwest sides of the Sint-Niklaaskerk were demolished as part of urban development works under the mayor Braun.\n\nInfo source: Inventaris Onroerend Erfgoed: Cataloniëstraat, https://id.erfgoed.net/themas/2861 (consulted on 1 August 2023).")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register the XIB file for the cell
        collectionView.register(UINib(nibName: "NewViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

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
