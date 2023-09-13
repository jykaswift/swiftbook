//
//  PreviewPage.swift
//  ArtCoverCollectionView
//
//  Created by Евгений Борисов on 13.09.2023.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    
    let imageNameArray = ["Alberto Ruiz - 7 Elements (Original Mix)",
                             "Dave Wincent - Red Eye (Original Mix)",
                             "E-Spectro - End Station (Original Mix)",
                             "Edna Ann - Phasma (Konstantin Yoodza Remix)",
                             "Ilija Djokovic - Delusion (Original Mix)",
                             "John Baptiste - Mycelium (Original Mix)",
                             "Lane 8 - Fingerprint (Original Mix)",
                             "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
                             "Metodi Hristov, Gallya - Badmash (Original Mix)",
                             "Veerus, Maxie Devine - Nightmare (Original Mix)"]

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DecriptionVC else {
            return
        }
        
        print("KEK")
        
        if let indexPath = self.collectionView.indexPathsForSelectedItems, let selected = indexPath.first {
            destination.trackName = imageNameArray[selected.row]
            print("LUL")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
    
        // Configure the cell
    
        return cell
    }

}
