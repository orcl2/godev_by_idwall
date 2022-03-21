//
//  CeoModel.swift
//  MockyApp
//
//  Created by Idwall Go Dev 003 on 21/03/22.
//

import Foundation

struct Founder: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
}

protocol FounderDelegate {
    func updateDatasource(with founders: [Founder])
}
