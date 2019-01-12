//
//  ViewController.swift
//  SimpleRealm
//
//  Created by amr.omraan@icloud.com on 01/12/2019.
//  Copyright (c) 2019 amr.omraan@icloud.com. All rights reserved.
//

import UIKit
import SimpleRealm

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let user = User()
    
    let databaseManager = DatabaseManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    @IBAction func addNewBtn(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Add New Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: { alert -> Void in
            let nameField = alertController.textFields![0] as UITextField
            let ageField = alertController.textFields![1] as UITextField
            
            self.user.name = nameField.text!
            self.user.age = ageField.text!
            self.user.id = UUID().uuidString
            
            self.databaseManager.create(object: self.user)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Add New Age"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseManager.readAll(object: user).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let result = databaseManager.readAll(object: user)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.name.text = result[indexPath.row].name
        cell.age.text = result[indexPath.row].age
        cell.id = result[indexPath.row].id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        print(cell.id!)
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
           
            self.databaseManager.deleteOneElement(object: self.user, id: cell.id!)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            // share item at indexPath
        }
        edit.backgroundColor = .blue
        delete.backgroundColor = .red
        
        return [delete, edit]
    }
    
}


class TableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    var id: String? = nil
}
