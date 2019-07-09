//
//  CoreDataStack.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataStack: NSObject {
    let persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "TripItem")
        
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    func saveContext() {
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
            
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchPersistedData(completion: @escaping (FetchItemsResult) -> Void) {
        
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        let viewContext = persistentContainer.viewContext
        
        do {
            let allItems = try viewContext.fetch(fetchRequest)
            completion(.success(allItems))
        } catch {
            completion(.failure(error))
        }
    }
}
enum FetchItemsResult {
    case success([Trip])
    case failure(Error)
}
