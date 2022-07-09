//
//  MyActivities+CoreDataProperties.swift
//  fefuactivity
//
//  Created by Vladoslav on 28.06.2022.
//
//

import Foundation
import CoreData


extension MyActivities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyActivities> {
        return NSFetchRequest<MyActivities>(entityName: "MyActivities")
    }

    @NSManaged public var itemType: String?
    @NSManaged public var itemTime: String?
    @NSManaged public var itemDistance: String?

}

extension MyActivities : Identifiable {

}
