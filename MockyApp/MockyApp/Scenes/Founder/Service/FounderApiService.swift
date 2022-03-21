//
//  ApiService.swift
//  MockyApp
//
//  Created by Idwall Go Dev 003 on 21/03/22.
//

import Foundation

struct FounderApiService {
    
    private let baseUrl = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    var delegate: FounderDelegate?
    
    func performRequest() {
        guard let url = URL(string: baseUrl) else { return }
        fetchFounders(with: url)
    }
    
    private func fetchFounders(with url: URL) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, urlResponse, Error in
            
            if let data = data {
                let founders = parseFounderFromJson(data)
                
                DispatchQueue.main.async {
                    delegate?.updateDatasource(with: founders)
                }
            }
        }
        
        task.resume()
    }
    
    private func parseFounderFromJson(_ data: Data) -> [Founder] {
        var founders: [Founder] = []
        
        let jsonDecoder = JSONDecoder()
        if let results = try? jsonDecoder.decode([Founder].self, from: data) {
            founders = results
        }
        
        return founders
    }
}
