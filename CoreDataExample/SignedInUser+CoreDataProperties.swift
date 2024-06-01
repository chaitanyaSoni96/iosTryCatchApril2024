//
//  SignedInUser+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Chaitanya Soni on 01/06/24.
//
//

import Foundation
import CoreData


extension SignedInUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SignedInUser> {
        return NSFetchRequest<SignedInUser>(entityName: "SignedInUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?

}

extension SignedInUser : Identifiable {

}
