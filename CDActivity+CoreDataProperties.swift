//
//  CDActivity+CoreDataProperties.swift
//  fefuactivity
//
//  Created by Vladoslav on 09.07.2022.
//
//

import Foundation
import CoreData


extension CDActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDActivity> {
        return NSFetchRequest<CDActivity>(entityName: "CDActivity")
    }

    @NSManaged public var itemDistance: Int64
    @NSManaged public var itemTime: String?
    @NSManaged public var itemType: String?
    @NSManaged public var itemDateStart: Date?
    @NSManaged public var itemDateFinish: Date?

}

extension CDActivity : Identifiable {

}
