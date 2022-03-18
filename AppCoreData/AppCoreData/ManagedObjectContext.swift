//
//  ManagedObjectContext.swift
//  AppCoreData
//
//  Created by Idwall Go Dev 003 on 17/03/22.
//

import Foundation
import CoreData
import UIKit

typealias onCompletionHandler = (String) -> (Void)

protocol ManagedProtocol {
    func getAll() -> [Person]
}

protocol ManagedSavedProtocol {
    func save(object: Any, onCompletionHandler: onCompletionHandler)
}

protocol ManagedDeleteProtocol {
    func delete(id: String, onCompletionHandler: onCompletionHandler)
}

class ManagedObjectContext: ManagedProtocol, ManagedSavedProtocol, ManagedDeleteProtocol {
    
    private let entity = "Users"
    
    static var shared: ManagedObjectContext {
        let instance = ManagedObjectContext()
        return instance
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func save(object: Any, onCompletionHandler: (String) -> (Void)) {
        
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
         
        guard let data = object as? KeyedValues else {
            onCompletionHandler("Error")
            return
        }
        
        transaction.setValuesForKeys(data.keyedValues)

        do {
            try context.save()
            onCompletionHandler("Save Succes")
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func delete(id: String, onCompletionHandler: (String) -> (Void)) {
        let context = getContext()
        
        let predicate = NSPredicate(format: "id == %@", "\(id)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fetchRequest.predicate = predicate
        
        do {
            
            let fecthResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fecthResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            
            onCompletionHandler("Delete Success")
            
        } catch let error as NSError {
            print("Fetch failed \(error.localizedDescription)")
        }
        
    }
    
    func getAll() -> [Person] {
        
        var listPerson: [Person] = []
        
        let fecthRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        do {
            guard let persons = try getContext().fetch(fecthRequest) as? [NSManagedObject] else { return listPerson }
            
            for person in persons {
                if let id = person.value(forKey: "id") as? UUID,
                    let name = person.value(forKey: "name") as? String,
                    let lastName = person.value(forKey: "lastName") as? String,
                    let age = person.value(forKey: "age") as? Int {
                    
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    
                    listPerson.append(person)
                }
            }
            
        } catch let error as NSError {
            print("Error in request \(error.localizedDescription)")
        }
        
        return listPerson
    }
}
