//
//  DataSource.swift
//  desafioAula07
//
//  Created by Renato F. dos Santos Jr on 15/03/22.
//

import Foundation

struct User {
    var name: String
    var age: Int
    var avatar: String
}

struct DataSource {
    static let users: [User] = [User(name: "William", age: 20, avatar: "person"),
                                User(name: "Renato", age: 19, avatar: "person"),
                                User(name: "Matheus", age: 22, avatar: "person"),
                                User(name: "Alison", age: 19, avatar: "person"),
                                User(name: "Luis", age: 30, avatar: "person")]
}
