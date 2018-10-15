//
//  ViewController3.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 08/10/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

struct CellData {
    var name: String
    var isSelected: Bool
}

class ViewController3: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var days: [String] = ["Sun", "Mon", "Tue", "Wed", "Fri", "Sat"]
    var months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var dayObjects: [CellData] = []
    var monthObjects: [CellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        
        self.setDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editTapped(_ sender: Any) {
        self.listTableView.isEditing = !self.listTableView.isEditing
        if self.listTableView.isEditing {
            (sender as? UIBarButtonItem)?.title = "Done"
        } else {
            (sender as? UIBarButtonItem)?.title = "Edit"
        }
    }
    
    func setDataSource() {
        
        dayObjects = []
        monthObjects = []
        
        for day in self.days {
            let cellData = CellData(name: day, isSelected: false)
            self.dayObjects.append(cellData)
        }
        
        for month in self.months {
            let cellData = CellData(name: month, isSelected: false)
            self.monthObjects.append(cellData)
        }
    }
    
    func showAlert(forIndex indexPath: IndexPath) {
        
        var title: String = ""
        var message: String = ""
        switch indexPath.section {
        case 0:
            let state = (self.dayObjects[indexPath.row].isSelected ? "Selected" : "Not Selected")
            title = "Days Selected"
            message = "You have selected \(self.dayObjects[indexPath.row].name) day and its state is \(state)"
        case 1:
            let state = (self.monthObjects[indexPath.row].isSelected ? "Selected" : "Not Selected")
            title = "Month Selected"
            message = "You have selected \(self.monthObjects[indexPath.row].name) Month and its state is \(state)"
        default:
            break
        }
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController3 : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (section == 0) ? self.dayObjects.count : self.monthObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = self.dayObjects[indexPath.row].name
            cell.detailTextLabel?.text = "Its day order is \(indexPath.row)"
            
            if self.dayObjects[indexPath.row].isSelected {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        } else {
            cell.textLabel?.text = self.monthObjects[indexPath.row].name
            cell.detailTextLabel?.text = "Its Month order is \(indexPath.row)"
            if self.monthObjects[indexPath.row].isSelected {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        cell.textLabel?.textColor = UIColor.white
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Days"
        }
        return "Months"
    }
}

extension ViewController3: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.dayObjects[indexPath.row].isSelected = !self.dayObjects[indexPath.row].isSelected
        } else {
            self.monthObjects[indexPath.row].isSelected = !self.monthObjects[indexPath.row].isSelected
        }
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        self.showAlert(forIndex: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
}



















    








































