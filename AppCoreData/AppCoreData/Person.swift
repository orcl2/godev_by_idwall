//
//  Person.swift
//  AppCoreData
//
//  Created by Idwall Go Dev 003 on 17/03/22.
//

import Foundation

struct Person: KeyedValues {
    var id: UUID
    var name: String
    var lastName: String
    var age: Int
    
    
    var keyedValues: [String : Any] {
        
        return [
            "id": id,
            "name": name,
            "lastName": lastName,
            "age": age]
    }
}

protocol KeyedValues {
    var keyedValues: [String: Any] { get }
}

