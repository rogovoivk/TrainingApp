//
//  ShowActivity+CoreDataProperties.swift
//  fefuactivity
//
//  Created by Vladoslav on 24.06.2022.
//
//

import Foundation
import CoreData


extension ShowActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShowActivity> {
        return NSFetchRequest<ShowActivity>(entityName: "ShowActivity")
    }
    @NSManaged public var itemDistance: String?
    @NSManaged public var itemTime: String?
    @NSManaged public var itemProcess: String?

}

extension ShowActivity : Identifiable {

}
