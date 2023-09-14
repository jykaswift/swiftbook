//
//  ContentViewController.swift
//  UIPageViewController
//
//  Created by Евгений Борисов on 14.09.2023.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var presentText = ""
    var emodji = ""
    var currentPage = 0
    var numberOfPages = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = presentText
        emojiLabel.text = emodji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        // Do any additional setup after loading the view.
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
