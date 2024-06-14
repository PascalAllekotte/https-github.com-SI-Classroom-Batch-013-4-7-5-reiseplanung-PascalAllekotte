//
//  PresistentStore.swift
//  TravelPlaner
//
//  Created by Pascal Allekotte on 14.06.24.
//

import Foundation
import SwiftUI
import CoreData

struct PersistentStore{
    
    // MARK: Variables
    
    private let container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    //____________________
    
    
    
    static let shared = PersistentStore()
    
    
    
    init() {
        container = NSPersistentContainer(name: "CoreData")
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        container.loadPersistentStores{_, error in
            if let error = error as NSError? {
                fatalError("Error with Core Data: \(error), \(error.userInfo)")
            }
            
        }
    }
}
