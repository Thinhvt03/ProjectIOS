//
//  AddStudentViewController.swift
//  CoreData - SearchDanhBa
//
//  Created by Hoàng Loan on 17/02/2023.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var SubStudentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func DidTapSaveButton(_ sender: Any) {
        var newName = SubStudentTextField.text
        if newName?.count == 0 {
            alertForAaddButton()
        } else {
            DatabaseHandler.saveData(Name: newName!)
            navigationController?.popViewController(animated: true)
            let vcViewController = navigationController?.topViewController as! ViewController
            vcViewController.tableView.reloadData()
            newName = ""
        }
    }
    
    private func alertForAaddButton() {
        let Alert = UIAlertController(title: "Error", message: "Add a new name", preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(Alert, animated: true)
    }
}





