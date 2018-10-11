//
//  ViewController2.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 08/10/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var valueLabel: UILabel!
    
    var textValue : Int = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let textValue = self.valueTextField.text {
            if let fontValue = Int(textValue) {
                if ((fontValue > 10) && (fontValue < 100)) {
                    let fontSize = Double(fontValue)
                    self.valueLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
                }
                else{
                    self.showAlert(withTitle: "oops", andMessage: "enter value in range")
                }
                
            }
        }
        self.valueTextField.text = ""
    }
    
    
    func showAlert(withTitle title: String, andMessage message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
}


}




























    
