//
//  CustomCollectionViewCell.swift
//  Desafio_Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier = "CustomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: String) {
        if let image = UIImage(named: image) {
            
            carImageView.image = image
            return
        }
        
        carImageView.image = UIImage(systemName: "questionmark")
    }
}
