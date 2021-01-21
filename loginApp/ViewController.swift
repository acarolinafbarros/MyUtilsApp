//
//  ViewController.swift
//  loginApp
//
//  Created by Carolina Barros on 13/01/2021.
//  Copyright © 2021 Carolina Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginMessage: UILabel!
    
    let user1 = User(username: "carolinabarros", password: "123!")
    
    override func viewDidLoad() {
        loginMessage.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkLogin(_ sender: Any) {
        
        if (usernameLabel.text == "" || passwordLabel.text == "") {
            loginMessage.isHidden = false
            loginMessage.text = "Please fill all the fields"
        } else if (usernameLabel.text == user1.username && passwordLabel.text == user1.password) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let welcomeViewController = storyBoard.instantiateViewController(withIdentifier: "Welcome") as! WelcomeViewController
            welcomeViewController.user = "Welcome, \(user1.username)"
            
            self.navigationController?.pushViewController(welcomeViewController, animated: true)
        } else {
            loginMessage.isHidden = false
            loginMessage.text = "The credentials are incorrect. Please try again"
        }
    }
    
}

