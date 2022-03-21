//
//  ApiService.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 19/03/22.
//

import Foundation

enum TrackError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getTrackList(artistName term: String, completion: @escaping (Result<TrackList, TrackError>) -> Void)
    
}

class ApiService: ServiceProtocol {
    
    let baseUrl = "https://itunes.apple.com"
    
    let session = URLSession.shared
    
    static var shared: ApiService {
        let instance = ApiService()
        return instance
    }
    
    func getTrackList(artistName term: String, completion: @escaping (Result<TrackList, TrackError>) -> Void) {
        
        let action = "search"
        let param1 = "media=music"
        let param2 = "term=\(term)"
        let queryUrl = "\(baseUrl)/\(action)?\(param1)&\(param2)"
        
        guard let url = URL(string: queryUrl) else { return completion(.failure(.urlInvalid))
        }
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable)) }
                
                let decoder = JSONDecoder()
                let trackList = try decoder.decode(TrackList.self, from: jsonData)
                
                completion(.success(trackList))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}
