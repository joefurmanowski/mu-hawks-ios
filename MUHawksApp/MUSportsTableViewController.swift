//
//  MUSportsTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/26/22.
//

import UIKit

class MUSportsTableViewController: UITableViewController {
    
    let sharedInstance = MUModel.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.getSports().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = sharedInstance.getSports()[indexPath.row].name
        cell.textLabel?.textColor = .white

        return cell
    }

    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sportWebsitesSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUSportWebsitesTableViewController
        destination_VC.selectedSport = sharedInstance.getSports()[self.tableView.indexPathForSelectedRow!.row]
    }

}
