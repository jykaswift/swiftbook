//
//  DecriptionVC.swift
//  ArtCoverCollectionView
//
//  Created by Евгений Борисов on 13.09.2023.
//

import UIKit

class DecriptionVC: UIViewController {

    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    
    var trackName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackLabel.text = trackName
        trackImage.image = UIImage(named: trackName)
        // Do any additional setup after loading the view.
        trackLabel.numberOfLines = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
