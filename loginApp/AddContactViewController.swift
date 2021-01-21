//
//  AddContactViewController.swift
//  loginApp
//
//  Created by Carolina Barros on 20/01/2021.
//  Copyright © 2021 Carolina Barros. All rights reserved.
//

import UIKit

protocol CreateContactProtocol {
    func createContact(newContact: Contact)
}

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelPhone: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var deletegate: CreateContactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNewContact(_ sender: Any) {
        if (
            (labelName.text == "" || ((labelName.text?.isEmpty) == nil)) ||
            (labelPhone.text == "" || ((labelPhone.text?.isEmpty) == nil))
        ) {
            errorLabel.text = "Please, fill all the fields associated to the new contact"
        } else {
            let newContact = Contact(name: labelName.text ?? "N/A", phoneNumber: labelPhone.text ?? "N/A")
            self.deletegate?.createContact(newContact: newContact)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
