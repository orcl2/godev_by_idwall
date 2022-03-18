//
//  ViewController.swift
//  AppCoreData
//
//  Created by Idwall Go Dev 003 on 17/03/22.
//

import UIKit

class ViewController: UIViewController {

    var persons: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func get(_ sender: UIButton) {
        
        persons = ManagedObjectContext.shared.getAll()
        persons.map { person in
            print(person)
        }
    }
    
    @IBAction func saveEntity(_ sender: UIButton) {
        let person = Person(id: UUID(), name: "William Daniel", lastName: "da Silva Kuhs", age: 28)
        ManagedObjectContext.shared.save(object: person) { result in
            print(result)
        }

    }
    
    @IBAction func deleteEntity(_ sender: UIButton) {
        
        
        ManagedObjectContext.shared.delete(id: "25F1EC2F-DA99-45D1-B1A0-DF2FF441D905"){ result in
            print(result)
        }

    }
    
}

