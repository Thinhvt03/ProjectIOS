//
//  StudentData+CoreDataProperties.swift
//  CoreData - SearchDanhBa
//
//  Created by Hoàng Loan on 10/02/2023.
//
//

import Foundation
import CoreData


extension StudentData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentData> {
        return NSFetchRequest<StudentData>(entityName: "StudentData")
    }

    @NSManaged public var studentName: String?

}

extension StudentData : Identifiable {

}
