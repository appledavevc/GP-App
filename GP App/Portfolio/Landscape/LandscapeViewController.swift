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
    
    private var landscape: [Landscape] = [Landscape(image: "L22Azaleapark", name: "Azaleapark", information: "21/12/2022 - 17u22\n\nA park close to the old town hall in Sint-Amandsberg."),
                                          Landscape(image: "L10Dampoort", name: "Gent-Dampoort", information: "28/11/2012 - 13u02\n\nGent-Dampoort is the city's second main train station after Gent-Sint-Pieters. From Gent-Dampoort, the city centre is quick and easy to reach by bike, by public transport or on foot. Many international buses also stop at Gent-Dampoort.\n\nInfo source: Visit Gent"),
                                          Landscape(image: "L11GSP", name: "Gent-Sint-Pieters", information: "15/02/2013 - 19u34\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L12GSP", name: "Heritage PCC tram", information: "24/04/2021 - 14u07\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L13Korenmarkt", name: "Korenmarkt by Night", information: "26/04/2021 - 21u55\n\nThere’s far more to the Korenmarkt area than eating, drinking and shopping. Although the square has been extensively refurbished over the years, you will still find centuries of Ghent history right before your eyes. Almost **1000 years ago**, this was the place where grain was traded after arriving in the city along the Scheldt and Lys rivers. This enabled the Korenmarkt to grow into an **economic centre** over the course of the Middle Ages. The square later became the place where mail coaches arrived and departed. This is why the **imposing post-office building** was built here at the beginning of the 20th century on the foundations of what was originally intended to be the Royal Dutch Theatre.\n\nInfo source: Visit Gent"),
                                          Landscape(image: "L14Graslei", name: "Graslei", information: "01/05/2021 - 17u45\n\nShips have been docking here since the 11th century and Ghent wouldn’t have it any other way. It is like the song of the Lorelei. The beauty of the Graslei in Ghent brings everyone and everything to a standstill. This is the place where beautiful façades are reflected in the River Lys. Tourists and residents alike relax on either side of the water, whether dangling their legs over the quay, or sitting comfortably at a café terrace.\n\nInfo source: Visit Gent"),
                                          Landscape(image: "L15GSP", name: "Gent-Sint-Pieters", information: "05/05/2021 - 5u15\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L16GSP", name: "Gent-Sint-Pieters", information: "13/05/2021 - 21u55\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L17GrootBegijnhof", name: "Groot-Begijnhof", information: "13/06/2021 - 14u55\n\nIn 1872, Duke Engelbertus van Arenberg purchased the northwestern part of Sint-Baafskouter in Sint-Amandsberg, measuring 8 hectares, known as Nieuwhofkouter. The intention was to construct a new beguinage on this land for the beguines expelled by the Commission of the Civil Godshuizen from the confiscated Groot or Sint-Elisabethbeguinage in Ghent, which was founded in 1234.\n\nIn 1873, construction of the beguinage commenced based on the design by architect Arthur Verhaegen.\n\nThe beguinage was entirely planned in the style of medieval beguinages, resembling a walled city within a city, inspired by the Flemish Gothic architecture of the 15th century.\n\nIt extends over a rectangular southwest-northeast oriented site, with the main entrance located on the northeastern side at the end of Jan Roomsstraat, and the back entrance facing Engelbert Van Arenbergstraat on the southwestern side.\n\nAt the center and diagonally on this site lies an east-west oriented 'dries' (a central green area) with the church; opposite the west facade of the church stands the Groothuis, along with the infirmary and the chapel of Saint Anthony of Padua.\n\nThe beguinage comprises three squares: Sint-Elisabethplein between the church and the Groothuis, Sint-Beggaplein behind the church, and Sint-Antoniusplein in front of the rear exit. The first and second squares feature a grassy area, serving as a pasture, bordered with trees and wrought-iron fencing.\n\nEight streets provide straight and winding connections to the central 'dries' from the entrances: Arenbergstraat, Heilige Amandusstraat, Heilige Bavostraat, Heilige Livinusstraat, Puis IX-straat, Calvariebergstraat, Onze-Lieve-Vrouwstraat, and Heilige Kruisstraat.\n\nThe beguinage, consisting of fourteen convents for around thirty beguines and eighty houses, was inaugurated on September 29, 1874.\n\nInfo source: Inventaris Onroerend Erfgoed: Groot Begijnhof, https://id.erfgoed.net/erfgoedobjecten/122162 (consulted on 5 August 2023)."),
                                          Landscape(image: "L18Tweebruggen", name: "Tweebruggen", information: "07/07/2021 - 23u05\n\nA bridge connecting the Kasteellaan with the Visserij and onwards to de Zuid."),
                                          Landscape(image: "L19Houtdok", name: "Houtdok", information: "02/07/2022 - 19u02\n\nA really cool public park, a promenade, an atypical canoe rental company and an equally atypical bar/nightlife venue: there’s a lot happening at the Houtdok.  Just go and explore!\n\nInfo source: Visit Gent"),
                                          Landscape(image: "L20Houtdok", name: "Houtdok", information: "02/07/2022 - 19u05\n\nA really cool public park, a promenade, an atypical canoe rental company and an equally atypical bar/nightlife venue: there’s a lot happening at the Houtdok.  Just go and explore!\n\nInfo source: Visit Gent"),
                                          Landscape(image: "L21Houtdok", name: "Houtdok", information: "02/07/2021 - 19u07\n\nA really cool public park, a promenade, an atypical canoe rental company and an equally atypical bar/nightlife venue: there’s a lot happening at the Houtdok.  Just go and explore!\n\nInfo source: Visit Gent"),
                                          Landscape(image: "L24GSP", name: "Gent-Sint-Pieters", information: "04/02/2023 - 18u31\n\nGent-Sint-Pieters railway station is the main railway station in Ghent. The origins of the railway station is a small station on the Ghent–Ostend line in 1881. At that time, the main railway station of Ghent was the South railway station, built in 1837. \n\nAt the occasion of the 1913 International Exposition in Ghent, a new Sint-Pieters railway station was built.\n\nIt was designed by the architect Louis Cloquet and finished in 1912 just before the World's Fair."),
                                          Landscape(image: "L1OudeDokken", name: "Power plant", information: "25/07/2023 - 21u22\n\nThe power plant was built in the 1920s in the centre of Ghent, close to Dampoort.\n\nUnder the direction of the City of Ghent, construction of the diesel hall began in the late 1960s. Since then, the tall chimney of this building has become a distinctive feature of the Ghent skyline.\n\nAfter the Ham power plant was integrated into the production park of EDF Luminus and connected to the national grid, the diesel generators gradually served more as peak power plants, operating for a limited number of hours in emergencies.\n\nIn 1993, the coal-fired units were demolished and replaced by a combined cycle unit (STEG unit).\n\nThirteen years later, two additional peak units powered by natural gas were put into service.\n\nIn 2006, two diesel generators were demolished, while the third one remained operational as an emergency unit during renovation works. It was taken out of service upon the inauguration of the new gas turbines.\n\nInfo source: Gent-Geprent"),
                                          Landscape(image: "L2OudeDokken", name: "Bataviabrug", information: "25/07/2023 - 21u09\n\nThe Bataviabrug is the first of two new cyclists' and pedestrians' bridges that will connect the future district at the Oude Dokken with the city centre.\n\nLocal residents started using them during the summer of 2012. The Bataviabrug was the first major infrastructure project at the Oude Dokken.\n\nInfo source: Stad Gent"),
                                          Landscape(image: "L3OudeDokken", name: "Schipperskaai", information: "25/07/2023 - 21u04\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L4OudeDokken", name: "Koopvaardijlaan", information: "25/07/2023 - 21u17\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L5OudeDokken", name: "Dampoort", information: "25/07/2023 - 21u27\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L6OudeDokken", name: "Dok-Noord", information: "25/07/2023 - 21u09\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L7OudeDokken", name: "Bataviabrug", information: "25/07/2023 - 21u12\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L8OudeDokken", name: "Bataviapad", information: "25/07/2023 - 21u14\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L9OudeDokken", name: "Koopvaardijlaan", information: "25/07/2023 - 21u21\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
                                          Landscape(image: "L23OudeDokken", name: "Kleindokkaai", information: "25/07/2023 - 21u21\n\nA view of the water, beautiful sunsets, plenty of space. The Oude Dokken district has it all. Oude Dokken is the collective name for an urban regeneration project in the area surrounding the former docks Houtdok, Achterdok and Handelsdok, which used to be where the city’s port activities took place. For almost twenty years now, this part of the city has been evolving into a modern, lively district.\n\nFor those who come to the Oude Dokken district from time to time, it’s obvious: there’s always something new going on in this part of the city. Apartment buildings with a modern architectural design are erected, enterprises find a new home and parking spaces and play areas for kids are developed.  And a lot of plans are ready for the years to come as well. These are exciting times for the old Ghent port area! \n\nInfo source: Visit Gent"),
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
