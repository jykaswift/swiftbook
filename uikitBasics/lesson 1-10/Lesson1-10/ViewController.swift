//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Евгений Борисов on 10.09.2023.
//

import UIKit

class ViewController: UIViewController {

    
    var uiElements = [
        "UISegmentedControl",
        "UILabel",
        "UISlider",
        "UITextField",
        "UIButton",
        "UIDatePicker"
    ]
    
    @IBOutlet weak var textView: UITextView!
    var selectedElement: String?
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var hidenLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var `switch`: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    
    func hideAllElements() {
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        datePicker.isHidden = true
    }


    @IBAction func choiseSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("Something wrong!")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sender.setValue(sender.value.rounded(), animated: true)
        label.text = String(sender.value)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        guard textField.text?.isEmpty == false else {
            return
        }
        
        if let _ = textField.text?.rangeOfCharacter(from: .decimalDigits) {
            let alert = UIAlertController(title: "Format wrong", message: "Name format is wrong", preferredStyle: .alert)
            alert.addTextField()
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
                let a = alert.textFields![0].text ?? "LUL"
                label.text = a
            })
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
            

        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Kek")
       // textView.resignFirstResponder()
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        
        let dateValue = dateFormatter.string(from: sender.date)
        
        label.text = dateValue
        
    }
    
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "DOne", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolbar
        
        toolbar.barTintColor = .brown
        toolbar.tintColor = .white
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func choideUIElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        elementPicker.backgroundColor = .brown
        
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        let elements: [UIView] = [datePicker, label, textField, slider, segmentedControl, doneButton]
        
        elements.forEach {
            $0.isHidden = !$0.isHidden
        }
        
        if sender.isOn {
            hidenLabel.text = "Показать все элементы"
        } else {
            hidenLabel.text = "Скрыть все элементы"
        }
        
    }
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        hideAllElements()
        switch row {
        case 0:
            segmentedControl.isHidden = false
        case 1:
            label.isHidden = false
        case 2:
            slider.isHidden = false
        case 4:
            doneButton.isHidden = false
        case 5:
            datePicker.isHidden = false
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
         var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = pickerViewLabel.font.withSize(23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
    
    
}

// viewdidload
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 1
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = String(slider.value)
        datePicker.locale = Locale(identifier: "ru_RU")
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        choideUIElement()
        createToolbar()
        
        // Next lessons after clear
        
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = view.backgroundColor
        textView.layer.cornerRadius = 10
        textView.delegate = self
        
    }
}


extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }

    
}
