//
//  ChatMessages.swift
//  WhatsAppScreen
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import Foundation

struct Profile: Codable {
    let id: Int
    let name: String
    let picture: String
    let status: String
    let friends: [Friend]
}
