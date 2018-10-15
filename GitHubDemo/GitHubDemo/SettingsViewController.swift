//
//  SettingsViewController.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 15/10/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var names: [String] = ["Appslucent", "DBIT", "SJBIT", "RNSIT"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((section == 0) || (section == 4)) {
            return 1
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 6
        } else if section == 3 {
            return 2
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as? AccountTableViewCell
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? CustomTableViewCell
            return cell!
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 105.0
        } else {
            return UITableViewAutomaticDimension
        }
    }
}
