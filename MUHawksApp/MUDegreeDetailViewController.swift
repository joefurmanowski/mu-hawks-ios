//
//  MUDegreeDetailViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/24/22.
//

import UIKit

class MUDegreeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let sharedInstance = MUModel.sharedInstance
    var selectedSchool: String?
    var selectedDepartment: String?
    var selectedDegree: String?
    var degree: Degrees?
    
    @IBOutlet weak var fullDegreeName: UILabel!
    @IBOutlet weak var degreeDescription: UILabel!
    @IBOutlet weak var requiredCourses: UITableView!
    @IBOutlet weak var showCourses: UISwitch!
    
    // identifier for data cell
    let courseCellReuseIdentifier = "courseCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.requiredCourses.dataSource = self
        self.requiredCourses.delegate = self
        degree = sharedInstance.findDegree(inSchool: selectedSchool!, andDept: selectedDepartment!, withName: selectedDegree!)
        self.title = degree?.name
        fullDegreeName.text = degree?.fullName
        degreeDescription.text = degree?.description
    }
    
    
    @IBAction func switchValueDidChange(_ sender: UISwitch) {
        if showCourses.isOn == true {
            requiredCourses.isHidden = false
        } else {
            requiredCourses.isHidden = true
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return degree!.requiredCourses.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: courseCellReuseIdentifier, for: indexPath)
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = .systemGray4
        } else {
            cell.backgroundColor = .white
        }

        cell.textLabel?.text = degree?.requiredCourses[indexPath.row].fullName
        cell.detailTextLabel?.text = degree?.requiredCourses[indexPath.row].name
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Required Courses  ✏️"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // change section header title to a better color
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
        }
    }

}
