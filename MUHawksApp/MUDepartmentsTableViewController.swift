//
//  MUDepartmentsTableViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/24/22.
//

import UIKit

class MUDepartmentsTableViewController: UITableViewController {
    
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
        return sharedInstance.getDepartments(inSchool: selectedSchool!).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "departmentCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = sharedInstance.getDepartments(inSchool: selectedSchool!)[indexPath.row].name
        cell.textLabel?.textColor = .white
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "departmentDegreesSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination_VC = segue.destination as! MUDepartmentDegreesTableViewController
        selectedDepartment = sharedInstance.getDepartments(inSchool: selectedSchool!)[tableView.indexPathForSelectedRow!.row].name
        destination_VC.selectedDepartment = selectedDepartment
        destination_VC.selectedSchool = selectedSchool
    }
}
