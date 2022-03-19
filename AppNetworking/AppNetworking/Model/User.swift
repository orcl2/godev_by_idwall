//
//  User.swift
//  AppNetworking
//
//  Created by Idwall Go Dev 003 on 18/03/22.
//

import Foundation
import CloudKit
import UIKit

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let address: Address
    let phone: String
    let company: Company
}

struct Address: Codable {
    let street, city, zipcode: String
}

struct Company: Codable {
    let name: String
}
