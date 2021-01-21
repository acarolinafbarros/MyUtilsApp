//
//  ContactViewController.swift
//  loginApp
//
//  Created by Carolina Barros on 15/01/2021.
//  Copyright © 2021 Carolina Barros. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CreateContactProtocol {
    
    @IBOutlet weak var addNewContact: UIButton!
    @IBOutlet weak var removeContact: UIButton!
    @IBOutlet weak var contactsTableView: UITableView!
    
    private var contactList = [
        Contact(name: "Carolina", phoneNumber: "+351 919458234"),
        Contact(name: "Pedro", phoneNumber: "+351 914009219"),
        Contact(name: "Sandra", phoneNumber: "+351 914009219"),
        Contact(name: "Sofia", phoneNumber: "+351 929873912"),
        Contact(name: "Oscar", phoneNumber: "+351 929873222"),
        Contact(name: "Maria", phoneNumber: "+351 929873922"),
        Contact(name: "Joao", phoneNumber: "+351 929873112"),
        Contact(name: "Joana", phoneNumber: "+351 919237391"),
        Contact(name: "Tiago", phoneNumber: "+351 929873922"),
        Contact(name: "Renata", phoneNumber: "+351 929873112"),
        Contact(name: "Sara", phoneNumber: "+351 919237391"),
    ]
    
    private var selectedContactsIndex: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        removeContact.isEnabled = false
    }
    
    func createContact(newContact: Contact) {
        self.contactList.append(newContact)
        self.contactsTableView.reloadData()
    }
    
    @IBAction func addNewContactTap(_ sender: Any) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let addContactViewController = storyboard.instantiateViewController(withIdentifier: "newContact") as! AddContactViewController
        addContactViewController.deletegate = self
            self.navigationController?.pushViewController(addContactViewController, animated: true)
    }
    
    @IBAction func removeContactTap(_ sender: Any) {
        contactList = contactList.enumerated().filter { !selectedContactsIndex.contains($0.offset) }.map { $0.element }
        selectedContactsIndex = []
        contactsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        cell.contactImage.image = contactList[indexPath.row].image
        cell.contactName.text = contactList[indexPath.row].name
        cell.contactPhone.text = contactList[indexPath.row].phoneNumber
        
        if selectedContactsIndex.contains(where: {$0 == indexPath.row}) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if contactsTableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            cell?.accessoryType = .checkmark
            selectedContactsIndex.append(indexPath.row)
            removeContact.isEnabled = true
        } else {
            cell?.accessoryType = .none
            selectedContactsIndex.removeAll{ $0 == indexPath.row }
            
            if selectedContactsIndex.count == 0 {
                removeContact.isEnabled = false
            }
        }
    }
}
