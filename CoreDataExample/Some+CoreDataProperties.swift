//
//  Some+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 19/05/24.
//
//

import Foundation
import CoreData


extension Some {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Some> {
        return NSFetchRequest<Some>(entityName: "Some")
    }

    @NSManaged public var attribute: Double

}

extension Some : Identifiable {

}
