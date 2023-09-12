//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Евгений Борисов on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var daysLivedLabel: UILabel!
    @IBOutlet weak var birtdayDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButton.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
    }


    @IBAction func getDayPassed() {
        print(birtdayDatePicker.date)
        let calendar = Calendar.current
        let currentDate = Date()
        let pickedDate = birtdayDatePicker.date
        
        let numberOfDays = calendar.dateComponents([.day], from: pickedDate, to: currentDate)
        daysLivedLabel.text = "Ты наслаждаешься жизнью уже \(numberOfDays.day!) дней"
    }
    
}

