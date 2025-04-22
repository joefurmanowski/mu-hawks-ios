//
//  MUAthleticsTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/26/22.
//

import UIKit

class MUAthleticsTableViewController: UITableViewController {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "athleticsCell", for: indexPath)

        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = .white
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Sports"
        case 1:
            cell.textLabel?.text = "Purchase Tickets"
        default:
            cell.textLabel?.text = "???"
        }
    
        return cell
    }

    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "sportsSegue", sender: self)
        case 1:
            performSegue(withIdentifier: "purchaseTicketsSegue", sender: self)
        default:
            break
        }
    }

}
