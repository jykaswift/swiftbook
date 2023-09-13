//
//  ViewController.swift
//  AwesomeBrowser
//
//  Created by Евгений Борисов on 13.09.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let homePage = "https://www.apple.com"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        searchField.delegate = self
        searchField.text = homePage
        webView.load(request)
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonTapped(_ sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}


extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        textField.resignFirstResponder()
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.searchField.text = webView.url?.absoluteString
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}
