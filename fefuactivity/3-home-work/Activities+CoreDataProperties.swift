//
//  Activities+CoreDataProperties.swift
//  fefuactivity
//
//  Created by Vladoslav on 28.06.2022.
//
//

import Foundation
import CoreData


extension Activities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activities> {
        return NSFetchRequest<Activities>(entityName: "Activities")
    }

    @NSManaged public var itemType: String?
    @NSManaged public var itemTime: String?
    @NSManaged public var itemDistance: String?

}

extension Activities : Identifiable {

}
