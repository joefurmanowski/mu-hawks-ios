//
//  MUAcademicsTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/24/22.
//

import UIKit

class MUAcademicsTableViewController: UITableViewController {
    
    let sharedInstance = MUModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "academicsCell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = .white
        
        // Configure the cell...
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Programs of Study"
        case 1:
            cell.textLabel?.text = "Departments and Schools"
        default:
            cell.textLabel?.text = "???"
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "programsSegue", sender: self)
        case 1:
           performSegue(withIdentifier: "schoolsSegue", sender: self)
        default:
            break
        }
    }

    @IBAction func donePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

