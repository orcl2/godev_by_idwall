//
//  ServicesApi.swift
//  DependencyInject
//
//  Created by Idwall Go Dev 003 on 30/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case error(String)
    case urlInvalid
    case noDataAvaliable
    case noProcessData
}

typealias completion = (Result<[User], Error>) -> Void

protocol ServicesApiProtocol: AnyObject {
    func getUsers(completion: @escaping completion)
}

class ServicesApi: ServicesApiProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let users = [User(name: "Will", email: "weasdwetrds@gmail.com")]
        
        completion(.success(users))
    }
}


