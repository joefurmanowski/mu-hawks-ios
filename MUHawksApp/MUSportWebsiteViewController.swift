//
//  MUSportWebsiteViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/26/22.
//

import UIKit
import WebKit

class MUSportWebsiteViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    var websiteUrl: String?
    var websiteTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = websiteTitle

        // Do any additional setup after loading the view.
        let url = URL(string: websiteUrl!)
        let request = URLRequest(url: url! as URL)
        myWebView.load(request)
    }

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func forwardButton(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }

    @IBAction func refreshButton(_ sender: Any) {
        myWebView.reload()
    }

}
