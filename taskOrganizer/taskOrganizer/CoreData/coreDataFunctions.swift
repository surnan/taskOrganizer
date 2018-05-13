//
//  coreDataFunctions.swift
//  taskOrganizer
//
//  Created by admin on 4/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData


struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let myContainer = NSPersistentContainer(name: "DailyTaskDefinitionFile")
        myContainer.loadPersistentStores { (store, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        let context = myContainer.viewContext
        return myContainer
    }()
    
}
