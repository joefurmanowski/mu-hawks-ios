//
//  MUProgramsTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/26/22.
//

import UIKit

class MUProgramsTableViewController: UITableViewController {

    let sharedInstance = MUModel.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.getAllDegrees().count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = sharedInstance.getAllDegrees()[indexPath.row].0.fullName
        cell.detailTextLabel?.text = sharedInstance.getAllDegrees()[indexPath.row].0.name

        return cell
    }

    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "degreeDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUDegreeDetailViewController
        let selectedSchool = sharedInstance.getAllDegrees()[self.tableView.indexPathForSelectedRow!.row].1
        let selectedDepartment = sharedInstance.getAllDegrees()[self.tableView.indexPathForSelectedRow!.row].2
        let selectedDegree = sharedInstance.getAllDegrees()[self.tableView.indexPathForSelectedRow!.row].0.name
        destination_VC.selectedSchool = selectedSchool
        destination_VC.selectedDepartment = selectedDepartment
        destination_VC.selectedDegree = selectedDegree
    }

}
