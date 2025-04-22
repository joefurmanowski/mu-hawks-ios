//
//  MUHawksViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/27/22.
//

import UIKit

class MUHawksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let sharedInstance = MUModel.sharedInstance
    let eventCellReuseIdentifier = "eventCell"
    
    @IBOutlet weak var eventsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.eventsTable.dataSource = self
        self.eventsTable.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.getEvents().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: eventCellReuseIdentifier, for: indexPath) as! MUEventTableViewCell
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = .systemGray4
        } else {
            cell.backgroundColor = .white
        }
        
        cell.eventTitle.text = sharedInstance.getEvents()[indexPath.row].name
        cell.eventDescription.text = sharedInstance.getEvents()[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: sharedInstance.getEvents()[indexPath.row].name, message: sharedInstance.getEvents()[indexPath.row].description, preferredStyle: .alert)
        let close = UIAlertAction(title: "Close", style: .default, handler: { _ in
            print("Close button pressed")
        })
        alert.addAction(close)
        self.present(alert, animated: true)  // this will present the Alert
    }

}
