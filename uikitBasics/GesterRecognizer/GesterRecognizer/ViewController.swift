//
//  ViewController.swift
//  GesterRecognizer
//
//  Created by Евгений Борисов on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swipesObservers()
        tapObserver()
    }
    
    
    func swipesObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    func tapObserver() {
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
    }
    
    @objc func tripleTapAction() {
        label.text = "Triple tap"
    }
    
    @objc func doubleTapAction() {
        label.text = "DOuble tap"
    }
    
    @objc func handlerSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:
            label.text = "Right"
        case .left:
            label.text = "Left"
        case .down:
            label.text = "Down"
        case .up:
            label.text = "up"
        default:
            return
        }
    }

}

