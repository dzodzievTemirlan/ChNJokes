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
    // MARK: - PersistetntContainer
    let persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ChNJokes")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    // MARK: - New Joke for MyJokesView
    func createNewItem(joke: String) {
        let context = persistentContainer.viewContext
        let item = Item(context: context)
        item.joke = joke
        let timestemp = Date().timeIntervalSince1970
        item.id = timestemp
        saveContext()
    }
    // MARK: - Save Person from SettingView
    func savePerson(firstName: String, lastName: String) {
        let context = persistentContainer.viewContext
        let person = Person(context: context)
        person.firstName = firstName
        person.lastName = lastName
        saveContext()
    }
    // MARK: - Context
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
    // MARK: - FetchItem method for MyJokesView
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
    // MARK: - FetchPerson method for get-request with new person
    func fetchPerson(complition: @escaping ([Person]?, Error?) -> Void) {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        do {
            let person = try managedContext.fetch(fetchRequest)
            complition(person, nil)
        } catch let error {
            complition(nil, error)
        }
    }
    // MARK: - Delete joke from MyJokeView
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
    // MARK: - Delete person
    func deletePerson(person: Person) {
        let context = persistentContainer.viewContext
        context.delete(person)
        do {
            try context.save()
            print("Удачное удаление")
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
