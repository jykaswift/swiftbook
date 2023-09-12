//
//  ViewController.swift
//  NamesApp
//
//  Created by Евгений Борисов on 09.09.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var partnerNameTF: UITextField!
    @IBOutlet weak var yourNameTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let distanationVC = segue.destination as? ResultViewController else {
            return
        }
        
        
        distanationVC.fisrName = yourNameTF.text
        distanationVC.secondName = partnerNameTF.text
        
    }
    
    
    
    @IBAction func resultButtonTapped() {
        guard let firstName = yourNameTF.text, let secondName = partnerNameTF.text else {
            return
        }
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(
                title: "Names are missing",
                message: "Please enter both names 😊"
            )
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueFirstVC(segue: UIStoryboardSegue) {
        (yourNameTF.text, partnerNameTF.text) = ("", "")
    }
    
    
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        print("KEK")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnerNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        
        return true
    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title:  "Ок", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
