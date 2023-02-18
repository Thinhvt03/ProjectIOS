//
//  ViewController.swift
//  CoreData - SearchDanhBa
//
//  Created by Hoàng Loan on 10/02/2023.
//

import UIKit
import CoreData

var studentList = [StudentData]()
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var searchControl = UISearchController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchControl.searchResultsUpdater = self
        searchControl.hidesNavigationBarDuringPresentation = false
        navigationItem.titleView = searchControl.searchBar
        
        DatabaseHandler.initializeFetchedResultsController()
        fetchedResultsController.delegate = self
    }
    
    @IBAction func AddStudentButton(_ sender: Any) {
        
        let vcAddStudent = AddStudentViewController()
        navigationController?.pushViewController(vcAddStudent, animated: true)
    }
}

// MARK: DataSource and Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let studentList = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = studentList.studentName
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let context = AppDelegate.managedObjectContext else {return}
        if editingStyle == .delete {
            let deleteObject = fetchedResultsController.object(at: indexPath)
            context.delete(deleteObject as NSManagedObject)
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error Occured while delete Data. Error: \(error), \(error.userInfo)")
            }
        }
    }
}
// MARK: Update SearchResults
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchControl.searchBar.text
        if searchText?.count == 0 {
            DatabaseHandler.initializeFetchedResultsController()
            self.tableView.reloadData()

        } else {
            DatabaseHandler.filterSearch(searchText: searchText!)
            self.tableView.reloadData()
        }
    }
}
//
extension ViewController: NSFetchedResultsControllerDelegate {
    //delegate
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            print("insert")
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            print("delete")
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        case .update:
            print("update")
            tableView.reloadRows(at: [indexPath!], with: .automatic)
            break;
        default:
            print("default")
        }
    }
}


