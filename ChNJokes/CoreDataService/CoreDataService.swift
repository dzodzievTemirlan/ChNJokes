//
//  CoreDataService.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {
    static let shared = CoreDataService()
    
    let persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ChNJokes")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func createNewItem(joke: String) {
        let context = persistentContainer.viewContext
        let item = Item(context: context)
        item.joke = joke
        let timestemp = Date().timeIntervalSince1970
        item.id = timestemp
        saveContext()
    }
    
   private func saveContext () {
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
    
    func fetchItem(complition: @escaping ([Item]?, Error?) -> Void) {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Item>(entityName: "Item")
        do {
            let items = try managedContext.fetch(fetchRequest)
            complition(items, nil)
        } catch let error {
            complition(nil, error)
        }
    }
    
    func deleteSite(item: Item) {
        let context = persistentContainer.viewContext
        context.delete(item)
        do {
            try context.save()
            print("Удачное удаление")
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

