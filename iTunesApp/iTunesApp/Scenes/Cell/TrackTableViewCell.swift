//
//  TrackTableViewCell.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 19/03/22.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteStarButton: UIButton!
    
    static let identifier = "TrackTableViewCell"
    
    var track: Track! {
        didSet {
            DispatchQueue.main.async {
                self.updateUI(self.track)
                self.track.image = self.trackImageView.image
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        
        favoriteStarButton.isSelected.toggle()
        self.track.isFavorite = favoriteStarButton.isSelected
        
        updateImageButton()
        
        if favoriteStarButton.isSelected {
            saveFavoriteTrack(track: self.track)
        } else {
            deleteFavoriteTrack(trackId: self.track.trackID)
        }
    }
    
    func updateImageButton() {
        favoriteStarButton.isHidden = !favoriteStarButton.isSelected
    }
    
    private func updateUI(_ track: Track) {
        trackImageView.downloaded(from: track.artworkUrl100)
        titleLabel.text = track.trackName
        releaseDateLabel.text = track.releaseDate
        albumNameLabel.text = track.collectionName
        priceLabel.text = "\(track.trackPrice) \(track.currency)"
        favoriteStarButton.isSelected = track.isFavorite ?? false
        updateImageButton()
    }
    
    private func saveFavoriteTrack(track: Track) {
        ManagedObjectContext.shared.save(track: track) { result in
            print(result)
        }
    }
    
    private func deleteFavoriteTrack(trackId id: Int) {
        ManagedObjectContext.shared.delete(id: id) { result in
            print(result)
        }
    }
}


