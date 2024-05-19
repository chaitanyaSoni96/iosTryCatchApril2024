//
//  ToDo+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 19/05/24.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var taskName: String?
    @NSManaged public var taskDescription: String?
    @NSManaged public var createdDateEpoch: Int64
    @NSManaged public var updatedDateEpoch: Int64

}

extension ToDo : Identifiable {

}
