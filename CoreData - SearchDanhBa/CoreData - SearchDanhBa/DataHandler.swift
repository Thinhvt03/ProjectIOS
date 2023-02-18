//
//  DataHandler.swift
//  CoreData - SearchDanhBa
//
//  Created by Hoàng Loan on 10/02/2023.
//

import Foundation
import UIKit
import CoreData

var fetchedResultsController: NSFetchedResultsController<StudentData>!
class DatabaseHandler {
    
   static func saveData(Name: String) {
       guard let context = AppDelegate.managedObjectContext else {return}
        let StudentObject = NSEntityDescription.insertNewObject(forEntityName: "StudentData", into: context) as! StudentData
        StudentObject.studentName = Name
        do {
            try context.save()
            
        } catch {
            print("Error Occured While Saving Data")
        }
    }
    
    //init fetch result
   static func initializeFetchedResultsController() {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<StudentData> = StudentData.fetchRequest()
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "studentName", ascending: true)]
       guard let context = AppDelegate.managedObjectContext else {return}
       fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                              managedObjectContext: context,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    static func filterSearch(searchText: String) {
        
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<StudentData> = StudentData.fetchRequest()
        
        //Predicate
        fetchRequest.predicate = NSPredicate(format: "studentName contains %@", searchText)
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "studentName", ascending: true)]
        
        guard let context = AppDelegate.managedObjectContext else {return}
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                              managedObjectContext: context,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
}
