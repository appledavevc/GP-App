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
    
    private var vault: [Vault] = [Vault(image: "V1Bisdomkaai", name: "Bisdomkaai", information: "26/07/2023 - 07u19\n\nPhoto by: Filip Watteeuw"),
                                  Vault(image: "V2Afrikalaan", name: "Afrikalaan", information: "17/04/2022 - 20u04"),
                                  Vault(image: "V3Banierpark", name: "Banierpark", information: "30/07/2023 - 16u30"),
                                  Vault(image: "V4DeKrook", name: "De Krook", information: "15/04/2023 - 16u04"),
                                  Vault(image: "V5Braeckmanlaan", name: "Victor Braeckmanlaan", information: "28/06/2023 - 22u00"),
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
        collectionViewFlowLayout?.sectionInset = UIEdgeInsets(top: 20, left: spacing, bottom: 10, right: spacing)
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

