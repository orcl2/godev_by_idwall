//
//  ManagedObjectContext.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 19/03/22.
//

import Foundation
import CoreData
import UIKit

typealias onCompletionHandler = (String) -> (Void)

protocol ManagedProtocol {
    func get() -> [Track]
}

protocol ManagedSavedProtocol {
    func save(track: Track, onCompletionHandler: onCompletionHandler)
}

protocol ManagedDeleteProtocol {
    func delete(id: Int, onCompletionHandler: onCompletionHandler)
}

class ManagedObjectContext: ManagedProtocol, ManagedSavedProtocol, ManagedDeleteProtocol {
    
    private let entity = "FavoriteTrack"
    
    static var shared: ManagedObjectContext {
        let instance = ManagedObjectContext()
        return instance
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func save(track: Track, onCompletionHandler: (String) -> (Void)) {
        
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else {
            return
        }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
         
        transaction.setValue(track.trackID, forKey: "trackID")
        transaction.setValue(track.artistName, forKey: "artistName")
        transaction.setValue(track.collectionName, forKey: "collectionName")
        transaction.setValue(track.currency, forKey: "currency")
        transaction.setValue(track.trackPrice, forKey: "price")
        transaction.setValue(track.releaseDate, forKey: "releaseDate")
        transaction.setValue(track.trackName, forKey: "trackName")
        
        if let data = track.image?.pngData() {
            transaction.setValue(data, forKey: "artwork")
        }

        do {
            try context.save()
            onCompletionHandler("Save Succes")
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func delete(id: Int, onCompletionHandler: (String) -> (Void)) {
        let context = getContext()
        
        let predicate = NSPredicate(format: "trackID == %@", "\(id)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fetchRequest.predicate = predicate
        
        do {
            
            let fecthResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fecthResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            
            onCompletionHandler("Delete Success")
            
        } catch let error as NSError {
            print("Fetch failed \(error.localizedDescription)")
        }
        
    }
    
    func get() -> [Track] {
        
        var listTracks: [Track] = []
        
        let fecthRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        do {
            guard let tracks = try getContext().fetch(fecthRequest) as? [NSManagedObject] else {
                print("Error in request ")
                return listTracks
                
            }
            
            for track in tracks {
                
                    if let trackID = track.value(forKey: "trackID") as? Int,
                        let artistName = track.value(forKey: "artistName") as? String,
                        let collectionName = track.value(forKey: "collectionName") as? String,
                        let currency = track.value(forKey: "currency") as? String,
                        let trackPrice = track.value(forKey: "price") as? Double,
                        let releaseDate = track.value(forKey: "releaseDate") as? String,
                        let trackName = track.value(forKey: "trackName") as? String,
                        let artwork = track.value(forKey: "artwork") as? Data {
                    
                    let image = UIImage(data: artwork) ?? UIImage(systemName: "music.note")
                        
                    let track = Track(trackID: trackID, artistName: artistName, collectionName: collectionName, trackName: trackName, trackViewURL: "", artworkUrl100: "", trackPrice: trackPrice, releaseDate: releaseDate, trackTimeMillis: 0, country: "", currency: currency, primaryGenreName: "", contentAdvisoryRating: "", image: image, isFavorite: true)
                        print(track.trackID)
                        
                    listTracks.append(track)
                }
            }
            
        } catch let error as NSError {
            print("Error in request \(error.localizedDescription)")
        }
        
        return listTracks
    }
}
