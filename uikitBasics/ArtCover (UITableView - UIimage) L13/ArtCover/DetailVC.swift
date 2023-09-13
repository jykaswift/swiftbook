//
//  DetailVC.swift
//  ArtCover
//
//  Created by Евгений Борисов on 12.09.2023.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var trackTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("KEK")
        imageView.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
        titleLabel.numberOfLines = 0

    
    }
    
    deinit {
        print("LUL")
    }
    


}
