//
//  MUDepartmentDegreesTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/24/22.
//

import UIKit

class MUDepartmentDegreesTableViewController: UITableViewController {
    
    let sharedInstance = MUModel.sharedInstance
    var selectedSchool: String?
    var selectedDepartment: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedDepartment
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.getDeptDegrees(inSchool: selectedSchool!, andDept: selectedDepartment!).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "degreeCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = sharedInstance.getDeptDegrees(inSchool: selectedSchool!, andDept: selectedDepartment!)[indexPath.row].fullName
        cell.detailTextLabel?.text = sharedInstance.getDeptDegrees(inSchool: selectedSchool!, andDept: selectedDepartment!)[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "degreeDetailSegue", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUDegreeDetailViewController
        destination_VC.selectedSchool = selectedSchool
        destination_VC.selectedDepartment = selectedDepartment
        destination_VC.selectedDegree = sharedInstance.getDeptDegrees(inSchool: selectedSchool!, andDept: selectedDepartment!)[tableView.indexPathForSelectedRow!.row].name
    }

}
