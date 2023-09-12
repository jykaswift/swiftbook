//
//  ResultViewController.swift
//  NamesApp
//
//  Created by Евгений Борисов on 09.09.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var namesLabel: UILabel!
    private var resultValue = 0
    
    var fisrName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = "\(fisrName ?? "") and \(secondName ?? "")"
        resultValue = calculateCompability()
        resultLabel.text = resultValue.formatted(.percent)
        progressView.progress = Float(resultValue) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
        // Do any additional setup after loading the view.
    }
    
    private func countIdentinalSymbolsOf(
        fistName: String,
        secondName: String
    ) -> Int {
        let firstSet = Set(fistName.lowercased())
        let secondSet = Set(secondName.lowercased())
        return firstSet.intersection(secondSet).count
    }
    
    private func calculateCompability() -> Int {
        let compabilityValue = countIdentinalSymbolsOf(fistName: fisrName, secondName: secondName)
        let minLenghtName = Double(fisrName.count > secondName.count ? secondName.count : fisrName.count)
        let compabilityNamesPrecent = Int((Double(compabilityValue) / minLenghtName) * 100)
        return compabilityNamesPrecent > 60 ? 100 : compabilityNamesPrecent
        
    }

}
