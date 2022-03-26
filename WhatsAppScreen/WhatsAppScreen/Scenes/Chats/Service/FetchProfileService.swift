//
//  GetAll.swift
//  WhatsAppScreen
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import Foundation

class FetchProfileService {
    
    // MARK: Singleton
    static var shared: FetchProfileService {
        get {
            let instance = FetchProfileService()
            
            return instance
        }
    }
    
    // MARK: Private Constants
    private let baseUrl = "https://run.mocky.io/v3/ee4574c3-3979-45b5-b87a-b5ed09d46c5c"
    
    // MARK: Public Variables
    var delegate: ProfileDelegate?
    
    // MARK: Unique Public Method
    func execute() {
        guard let url = URL(string: baseUrl) else { return }
        performRequest(with: url)
    }
    
    // MARK: Private Methods
    private func performRequest(with url: URL) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, urlResponse, error in
            guard let safeData = data,
                  let profile = self.parseJSON(safeData) else {
                      return
                  }
            
            self.delegate?.updateModel(with: profile)
        }.resume()
    }
    
    private func parseJSON(_ profileData: Data) -> Profile? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Profile.self, from: profileData)
            
            let id = decodedData.id
            let name = decodedData.name
            let picture = decodedData.picture
            let status = decodedData.status
            let friends = decodedData.friends
            
            let profile = Profile(id: id, name: name, picture: picture, status: status, friends: friends)
            
            return profile
        } catch {
            return nil
        }
    }
}
