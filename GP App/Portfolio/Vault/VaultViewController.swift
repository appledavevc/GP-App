//
//  VaultViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class VaultViewController: UICollectionViewController {

    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems,
               let destinationController = segue.destination as? VaultDetailViewController {
                destinationController.vault = vault[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private var vault: [Vault] = [Vault(image: "V1Bisdomkaai", name: "Bisdomkaai", information: "26/07/2023 - 07u19\n\nWith the urbanization works in the area of the Reep, the Nederschelde was vaulted between Brabantdam and Geeraard de Duivelsteen (1883-1884) and provided with quay walls from Bisdomplein to its confluence with the Leie (1887-1890), creating the Bisdomkaai (and Nieuwbrugkaai).\n\nMeanwhile, this section of the historically significant border river (which separated West Francia from Lotharingia in 843) was also vaulted (1960) to make way for parking.\n\nThe current streetscape still reflects the typical 19th-century architecture, dominated by the neo-Renaissance-style building of the Rijksmiddelbare School (State Middle School), followed by a relatively homogeneous row of plastered neoclassical-style houses.\n\nSince 1966, a small grassy area with a bronze statue of Emperor Charles V on a bluestone pedestal with text was created at the end of the parking lot. The statue now stands in the Prinsenhof.\n\nThe entire area of the Reep and Bisdomkaai was redeveloped. The uncovering of this last part of the Nederschelde in the historical heart of Ghent is the final stage of the waterbound infrastructure works carried out in recent years.\n\nThe works have been quite extensive. Although the plans had been in place for some time, they encountered numerous challenges during the preparatory studies: historical heritage, lack of information about the old quay walls, a maze of underground pipes, the short distance to the houses, and more.\n\nThese were delicate issues that engineers had to find solutions for. Ultimately, it became necessary to develop separate technical solutions for both riverbanks, which had an impact on the overall concept. All of this took considerable time but was essential to minimize unforeseen circumstances during the works and reduce additional disruptions for the neighborhood.\n\nThe official opening took place on November 3, 2018, where the new water connection and the redeveloped surroundings were officially inaugurated.\n\nSimultaneously, the Scaldissluis, a little further downstream, was made ready for use.\n\nInfo source: Gent-Geprent\nPhoto by: Filip Watteeuw"),
                                  Vault(image: "V2Afrikalaan", name: "Afrikalaan", information: "17/04/2022 - 20u04\n\nThe Afrikalaan area lies on the border between the city and the port, intersected by waterways, railways, and road infrastructure. The area encompasses a variety of functions (work, residential, shopping, recreation, etc.).\n\nThe future Verapazbrug will connect Muidelaan over the water to Afrikalaan. Once the bridge is completed, the small city ring road will run via Afrikalaan to Dampoort. As a result, the traffic situation will change around Dok Noord, Stapelplein, and Dok Zuid.\n\nInfo source: Gent-Geprent"),
                                  Vault(image: "V3Banierpark", name: "Banierpark", information: "30/07/2023 - 16u30\n\nThe Banierpark is a snack garden where both young and old can enjoy edible greens:\n\n- Fruit trees (apple, quince, mirabelle, medlar, etc.)\n\n- Berry-bearing shrubs and climbing plants (kiwi, grape, raspberries, elderberries, etc.)\n\n- Nuts (chestnut, walnut, and hazelnut)\n\n- Herbs (woodruff, chervil, sorrel, mint, etc.)\n\nTo maintain the greenery, local residents organize workdays several times a year.\n\nThey can also deposit organic waste (GFT) at the composting site in the park on a weekly basis.\n\nInfo source: Stad Gent"),
                                  Vault(image: "V4DeKrook", name: "De Krook", information: "15/04/2023 - 16u04\n\nSince 2017, De Krook has been one of the most striking architectural landmarks in Ghent.\n\nThis award-winning building, situated at a bend or 'krook' in the Scheldt River, houses the public city library, laboratories, and offices of Ghent University, as well as the research center for nano-electronics and digital technology, imec.\n\nThere is also a café with a terrace that offers views of the Scheldt River bend and the city center.\n\nInfo source: De Krook"),
                                  Vault(image: "V5Braeckmanlaan", name: "Victor Braeckmanlaan", information: "28/06/2023 - 22u00\n\nThe Victor Braeckmanlaan is a central axis in Sint-Amandsberg, established during World War I on the former Gent-Antwerp railway line.\n\nThe wide street, with a straight east-west trajectory, starts as an extension of Land Van Waaslaan and continues as Alfons Braeckmanlaan. Locally, the street was initially known as the Nieuwe Antwerpsesteenweg.\n\nAfter its construction, the entire section of the avenue, including the current Alfons Braeckmanlaan, was referred to as Land Van Waaslaan. The current names were introduced only in 1927. The old name Land Van Waaslaan was retained for the section between Oostakkerstraat and Schoolstraat, the part between Schoolstraat and Rozebroekstraat became Victor Braeckmanlaan, and the segment between Rozebroekstraat and the station of Destelbergen was named Alfons Braeckmanlaan.\n\nThis way, the street names were chosen to honor the first three mayors of Sint-Amandsberg (Alfons Braeckman, Victor Braeckman, and Henri Van Cleemputte).\n\nVictor Braeckman was already a councilor in Oostakker before 1872 and became an alderman at the foundation of the independent municipality of Sint-Amandsberg. From 1895 to 1908, he served as the mayor of Sint-Amandsberg.\n\nThe original railway, on which Land Van Waaslaan, Victor Braeckmanlaan, and Alfons Braeckmanlaan were built, between Gent-Dampoort and Antwerp-Linkeroever, was in operation since August 9, 1847.\n\nThe terminal station on the square between Land Van Waaslaan and Dendermondsesteenweg was then named Land Van Waasstation.\n\nIn 1908, plans were made to realign this railway line in a wide arc, with two purposes: to merge the Antwerp-Ghent and Eeklo-Ghent lines at Gent-Dampoort station and to provide a railway station for Oostakker-Lourdes, near the place of pilgrimage.\n\nThis new route was completed in 1911, and the current Land Van Waaslaan, Victor Braeckmanlaan, and Alfons Braeckmanlaan were constructed during World War I on the freed-up grounds.\n\nDuring the war, it was decided that the appearance of Land Van Waaslaan, which then included Victor Braeckmanlaan, needed to be changed. In April 1916, the city council decided to pave the section between Oostakkerstraat and Schoolstraat and to fill the rest of the former railway track up to Rozebroekstraat with soil.\n\nIn December 1916, the Ghent contractors De Waele were commissioned to start paving immediately.\n\nA year later, in December 1917, the local contractor Pieter Bracke was the first to purchase six lots of building land along the new avenue. However, it remains uncertain whether Bracke was equally quick to start constructing houses.\n\nIn 1925, it was reported that the planned cobblestone works were never carried out due to war conditions, so Land Van Waaslaan still appeared as an unattractive street in 1925. This avenue was only paved with cobblestones in 1926 by the brothers Martin and Max Desmet from Zingem.\n\nOn either side of the avenue, we see ribbon development consisting of houses two to three stories high. Mainly, these are townhouses, interspersed with occasional multi-family homes and three-sided villas. The core of the buildings dates back to the 1920s-1930s.\n\nThe interwar buildings in Victor Braeckmanlaan are stylistically positioned between two extremes. On one hand, mainly decorative or modest Art Deco and historical styles can be observed, while on the other hand, there are a few modernist houses.\n\nArchitects who have left their mark on the avenue with their designs include Edgar Celie, Ernest Snoeck, and Emiel Callebaut.\n\nCelie's work features several buildings in the Beaux-Arts style (numbers 60, 105, 111, and 113), and one cottage-style house (number 143).\n\nSnoeck's repertoire includes a cottage-style house (number 155), as well as Art Deco (number 44) and modernist influences (number 179-181).\n\nCallebaut contributed two modernist houses to the street (numbers 141 and 159).\n\nInfo source: Inventaris Onroerend Erfgoed: Victor Braeckmanlaan, https://id.erfgoed.net/themas/3432 (consulted on 7 August 2023)"),
                                  Vault(image: "V6Coyensdanspark", name: "Coyensdanspark", information: "24/05/2022 - 18u04"),
                                  Vault(image: "V7Dampoort", name: "Dampoort", information: "11/11/2022 - 17u15"),
                                  Vault(image: "V8GrootVleeshuis", name: "Groot Vleeshuis", information: "03/01/2023 - 17u29"),
                                  Vault(image: "V9SecretPassageway", name: "Secret Passageway", information: "19/09/2022 - 16u55"),
                                  Vault(image: "V10GSP", name: "Gent-Sint-Pieters", information: "26/02/2022 - 10u41"),
                                  Vault(image: "V11Dampoort", name: "Dampoort", information: "19/06/2023 - 21u54"),
                                  Vault(image: "V12E40DrongenNoord", name: "E40 Drongen-Noord", information: "03/03/2022 - 21u58\n\nIt's very important to always stay fueled, by coffee that is."),
                                  Vault(image: "V13FlandersExpo", name: "Flanders Expo", information: "19/06/2023 - 22u45"),
                                  Vault(image: "V14GrootBegijnhof", name: "Groot-Begijnhof", information: "11/07/2023 - 21u53"),
                                  Vault(image: "V15GentDampoort", name: "Gent-Dampoort", information: "06/07/2023 - 16u21"),
                                  Vault(image: "V16GSP", name: "Gent-Sint-Pieters", information: "28/02/2023 - 18u55"),
                                  Vault(image: "V17LVW", name: "Land Van Waaslaan", information: "01/04/2023 - 22u21\n\nGeneral power outage in the Dampoort neighbourhood which caused an eery atmosphere."),
                                  Vault(image: "V18LVW", name: "Land Van Waaslaan", information: "11/07/2023 - 21u59"),
                                  Vault(image: "V19GrootBegijnhof", name: "Groot-Begijnhof", information: "07/05/2023 - 16u39"),
                                  Vault(image: "V20GrootBegijnhof", name: "Groot-Begijnhof", information: "07/05/2023 - 16u28"),
                                  Vault(image: "V21GrootBegijnhof", name: "Groot-Begijnhof", information: "07/05/2023 - 16u51"),
                                  Vault(image: "V22GrootBegijnhof", name: "Groot-Begijnhof", information: "07/05/2023 - 16u34")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register the XIB file for the cell
        collectionView.register(UINib(nibName: "VaultViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Set the spacing between cells (adjust the constants as needed)
        let spacing: CGFloat = 12
        let collectionViewFlowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewFlowLayout?.minimumLineSpacing = spacing
        collectionViewFlowLayout?.minimumInteritemSpacing = spacing
        collectionViewFlowLayout?.sectionInset = UIEdgeInsets(top: 20, left: 17, bottom: 10, right: 17)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vault.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! VaultViewCell

        let vaultItem = vault[indexPath.row]
        cell.vaultImageView.image = UIImage(named: vaultItem.image)
        cell.vaultNameLabel.text = vaultItem.name

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

