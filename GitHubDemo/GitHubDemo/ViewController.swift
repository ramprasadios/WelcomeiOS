//
//  ViewController.swift
//  GitHubDemo
//
//  Created by Ramprasad A on 18/09/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let username="appslucent"
    let password="123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return self.validate()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        if (self.usernameTextField.text?.lowercased() != self.username){
             self.showAlert(withTitle: "Oops!", andMessage: "Plesae enter valid Username")
        }
        else if(self.passwordTextField.text != self.password){
             self.showAlert(withTitle: "Oops!", andMessage: "Plesae enter valid Password")
        } else {
            let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2")
            self.navigationController?.pushViewController(vc3!, animated: true)
        }
    }
    
    func validate() -> Bool {
        if (self.usernameTextField.text?.lowercased() != self.username){
            self.showAlert(withTitle: "Oops!", andMessage: "Plesae enter valid Username")
            return false
        }
        else if(self.passwordTextField.text != self.password){
            self.showAlert(withTitle: "Oops!", andMessage: "Plesae enter valid Password")
            return false
        } else {
            return true
        }
    }
    
    func showAlert(withTitle title: String, andMessage message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    }


        

    


