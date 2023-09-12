//
//  ViewController.swift
//  lesson 11-25
//
//  Created by Евгений Борисов on 11.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // UITEXTVIEW
        textView.isHidden = true
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        textView.delegate = self
        
        //ProgressView
        
        progressView.setProgress(0, animated: true)
        
        
        
        // observers
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTextView(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTextView(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    
        //stepper
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 10
        
        // ProgressView
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.2
            } else {
                self.activityIndicator.stopAnimating()
                self.textView.isHidden = false
                self.progressView.isHidden = true
            }
        }
    }
    
    @objc func updateTextView(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] ,
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height - textViewBottomConstraint.constant, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }

    @IBAction func stepperTapped(_ sender: UIStepper) {
        let fontSize = CGFloat(sender.value)
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = String(textView.text.count)
        print("Text count \(text.count)")
        print("Range count \(range.length)")
        return textView.text.count + (text.count - range.length) <= 60
    }
}
