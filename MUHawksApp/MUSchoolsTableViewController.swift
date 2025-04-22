//
//  MUAcademicsTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/24/22.
//

import UIKit

class MUSchoolsTableViewController: UITableViewController {

    let sharedInstance = MUModel.sharedInstance
    var selectedSchool: String?
    var selectedDepartment: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.getSchools().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(sharedInstance.getSchools()[indexPath.row].name)"
        cell.textLabel?.textColor = .white
        return cell
    }

    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "departmentsSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUDepartmentsTableViewController
        selectedSchool = sharedInstance.getSchools()[tableView.indexPathForSelectedRow!.row].name
        destination_VC.selectedSchool = selectedSchool
    }

}
