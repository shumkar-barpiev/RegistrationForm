//
//  AppUser+CoreDataProperties.swift
//  RegistrationForm
//
//  Created by User on 4/11/22.
//
//

import Foundation
import CoreData


extension AppUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppUser> {
        return NSFetchRequest<AppUser>(entityName: "AppUser")
    }

    @NSManaged public var userName: String?
    @NSManaged public var password: String?
    @NSManaged public var id: UUID?

}

extension AppUser : Identifiable {

}
