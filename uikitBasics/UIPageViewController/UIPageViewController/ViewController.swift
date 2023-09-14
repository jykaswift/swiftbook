//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Евгений Борисов on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }
    
    func startPresentation() {
        
        let userDefaults = UserDefaults.standard
        
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        
        if let pageViewController = storyboard?.instantiateViewController(
            identifier: "PageViewController"
        ) as? PageViewController {
            present(pageViewController, animated: true)
        }
    }
    
   
}


