//
//  CustomTableViewCell.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 15/10/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
