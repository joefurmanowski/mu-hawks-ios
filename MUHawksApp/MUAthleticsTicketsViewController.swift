//
//  MUAthleticsTicketsViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/28/22.
//

import UIKit
import WebKit

class MUAthleticsTicketsViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    var webURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://mpv.tickets.com/schedule/?orgId=44869&agency=MNMV_PLAGENCY_MPV&CCID=MNMV#/?venue=athletics&view=list&includePackages=true")
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
