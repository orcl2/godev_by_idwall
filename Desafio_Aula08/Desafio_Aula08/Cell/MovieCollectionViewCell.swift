//
//  MovieCollectionViewCell.swift
//  Desafio_Aula08
//
//  Created by Idwall Go Dev 003 on 16/03/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setup(image: String, title: String) {
        movieImageView.image = UIImage(named: image)
        movieTitleLabel.text = title
    }

}
