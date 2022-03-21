//
//  Track.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 19/03/22.
//

import Foundation
import UIKit

// MARK: - TrackList
struct TrackList: Codable {
    let tracksCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case tracksCount = "resultCount"
        case tracks = "results"
    }
}

// MARK: - Track
struct Track: Codable {
    let trackID: Int
    let artistName, collectionName, trackName: String
    let trackViewURL: String
    let artworkUrl100: String
    let trackPrice: Double
    let releaseDate: String
    let trackTimeMillis: Int
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    var image: UIImage?
    var isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case trackID = "trackId"
        case artistName, collectionName, trackName
        case trackViewURL = "trackViewUrl"
        case artworkUrl100, trackPrice, releaseDate, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating
    }
}
