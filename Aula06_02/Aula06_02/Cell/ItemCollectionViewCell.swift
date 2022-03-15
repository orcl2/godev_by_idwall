//
//  ItemCollectionViewCell.swift
//  Aula06_02
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageLogo: UIImageView!
    
    static let identifier = "ItemCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(image: String){
        if let image = UIImage(systemName: image) {
            imageLogo.image = image
            return
        }
        
        imageLogo.image = UIImage(systemName: "swift")
    }
}
