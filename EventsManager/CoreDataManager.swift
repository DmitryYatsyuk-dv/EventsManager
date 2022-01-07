//
//  CoreDataManager.swift
//  EventsManager
//
//  Created by Lucky on 03.01.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var managerObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: managerObjectContext)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try managerObjectContext.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try managerObjectContext.fetch(fetchRequest)
            return events
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}

