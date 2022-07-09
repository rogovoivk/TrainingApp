//
//  CDActivity+CoreDataProperties.swift
//  fefuactivity
//
//  Created by Vladoslav on 08.07.2022.
//
//

import Foundation
import CoreData


extension CDActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDActivity> {
        return NSFetchRequest<CDActivity>(entityName: "CDActivity")
    }

    @NSManaged public var itemType: String?
    @NSManaged public var itemTime: String?
    @NSManaged public var itemDistance: String?

}

extension CDActivity : Identifiable {

}
