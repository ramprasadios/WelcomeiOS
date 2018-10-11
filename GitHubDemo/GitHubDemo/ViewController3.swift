//
//  ViewController3.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 08/10/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    var days: [String] = ["Sun", "Mon", "Tue", "Wed", "Fri", "Sat"]
    var months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController3 : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (section == 0) ? self.days.count : self.months.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = self.days[indexPath.row]
        } else {
            cell.textLabel?.text = self.months[indexPath.row]
        }
        
        return cell
    }
    
}



















    








































