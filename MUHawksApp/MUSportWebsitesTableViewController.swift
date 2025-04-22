//
//  MUSportDetailTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/28/22.
//

import UIKit

class MUSportWebsitesTableViewController: UITableViewController {
    
    var selectedSport: Sport?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = selectedSport?.name
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportDetailOptionCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.textColor = .white
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Homepage"
        case 1:
            cell.textLabel?.text = "Schedule"
        default:
            cell.textLabel?.text = "???"
        }

        return cell
    }


    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "sportWebsiteSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUSportWebsiteViewController
        
        switch self.tableView.indexPathForSelectedRow!.row {
        case 0: // user selected "Homepage"
            destination_VC.websiteUrl = selectedSport?.homepageUrl
            destination_VC.websiteTitle = "Homepage"
        case 1: // user selected "Schedule"
            destination_VC.websiteUrl = selectedSport?.scheduleUrl
            destination_VC.websiteTitle = "Schedule"
        default:
            break
        }
    }

}
