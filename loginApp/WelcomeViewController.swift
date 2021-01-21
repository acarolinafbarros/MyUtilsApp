//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Carolina Barros on 14/01/2021.
//  Copyright © 2021 Carolina Barros. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeTableView: UITableView!
    
    var user: String = ""
    let content: [String] = ["Contactos"]

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = user
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! Welcome2TableViewCell
        
        cell.labelCell.text = content[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let contactViewController = storyBoard.instantiateViewController(withIdentifier: "Contact") as! ContactViewController
            self.navigationController?.pushViewController(contactViewController, animated: true)
        default:
            print(content[indexPath.row])
        }

    }
}
