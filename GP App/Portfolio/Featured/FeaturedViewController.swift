//
//  FeaturedViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 24/07/2023.
//

import UIKit
import Photos

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        #if targetEnvironment(simulator)
            print("Cannot save image to photo album in the simulator.")
        #else
            if let cell = collectionView.cellForItem(at: indexPath) as? FeaturedViewCell, let image = cell.featuredImageView.image {
                saveImageToPhotoAlbum(image)
            }
        #endif
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    // MARK: - Photo Save Function

    private func saveImageToPhotoAlbum(_ image: UIImage) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.imageSaved(_:didFinishSavingWithError:contextInfo:)), nil)
            case .denied, .restricted:
                print("Photo library access denied or restricted.")
            case .notDetermined:
                print("Photo library access not determined.")
            case .limited:
                print("Photo library access limited.")
            @unknown default:
                fatalError("New status added. Update the switch statement.")
            }
        }
    }

    @objc private func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Error saving image to photo album: \(error.localizedDescription)")
        } else {
            print("Image saved to photo album successfully.")
        }
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
