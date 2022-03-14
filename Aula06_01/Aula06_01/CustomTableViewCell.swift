//
//  CustomTableViewCell.swift
//  Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(team: Team) {
        logoImageView.image = UIImage(systemName: team.logo)
        nameLabel.textAlignment = .center
        nameLabel.text = team.name
        descriptionLabel.text = team.description
    }

}
