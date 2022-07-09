//
//  DataStoreManager.swift
//  fefuactivity
//
//  Created by Vladoslav on 29.06.2022.
//

import Foundation
import CoreData

class DataStoreManager {
    lazy var persistentContainer: NSPersistentContainer = {
        print ("отслеживаем!! 1.1")
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        print ("отслеживаем!! 1.2")
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addActivity(type: String, distance: Int64, time: String, startDate: Date, finishDate: Date) {
        print ("отслеживаем!! 1")
        let activity = CDActivity(context: viewContext)
        print ("отслеживаем!! 2")
        activity.itemTime = time
        activity.itemDistance = distance
        activity.itemType = type
        activity.itemDateStart = startDate
        activity.itemDateFinish = finishDate
        
        print ("отслеживаем!! 3")
        do {
            try viewContext.save()
            print ("отслеживаем!! 4")
        } catch let error {
            print ("Error: \(error)")
        }
        
    }
    
    func loadActivity() -> [CDActivity]? {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDActivity")
//        if let actyvities = try? viewContext.fetch(fetchRequest) as? [Activities], !actyvities.isEmpty {
//            return actyvities
//        }
        
        let actyvities = try? viewContext.fetch(fetchRequest) as? [CDActivity]
        
        return actyvities
        
    }
}

