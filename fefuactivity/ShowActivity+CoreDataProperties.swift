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

    @NSManaged public var itemDistance: ?
    @NSManaged public var itemTime: ?
    @NSManaged public var itemProcess: ?

}

extension ShowActivity : Identifiable {

}