//
//  TaskListTableController.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 15/10/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

enum VCTypes: String {
    
    case task1 = "ViewController2"
    case task2 = "ViewController"
    case task3 = "ViewController3"
    case task4 = "SettingsViewController"
    
    static var tasksArray: [VCTypes] = [task1, task2, task3, task4]
}

class TaskListTableController: UITableViewController {
    
    var tasksList: [String] = ["Font Resizing", "Login Validation", "Displaying List", "Settings Screen"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasksList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "Task \(indexPath.row + 1): \(self.tasksList[indexPath.row])"

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*var vc = UIViewController()
        switch indexPath.row {
        case 0:
            vc = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController2"))!
        case 1:
            vc = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController"))!
        case 2:
            vc = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController3"))!
        default:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
         */
        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCTypes.tasksArray[indexPath.row].rawValue)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
