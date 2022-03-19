//
//  ServiceProtocol.swift
//  AppNetworking
//
//  Created by Idwall Go Dev 003 on 18/03/22.
//

import Foundation

enum UserError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getUsers(completion: @escaping (Result<[User], UserError>) -> Void)
}

class Service: ServiceProtocol {
    
    let session = URLSession.shared
    let urlString = "https://run.mocky.io/v3/f58859f3-9683-411f-bd9f-fba3559d2606"
    
    static var shared: Service {
        let instance = Service()
        return instance
    }
    
    func getUsers(completion: @escaping (Result<[User], UserError>) -> Void) {
        
        guard let url = URL(string: urlString) else { return completion(.failure(.urlInvalid)) }
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable)) }
                
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: jsonData)
                
                completion(.success(users))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
        
    }
}
