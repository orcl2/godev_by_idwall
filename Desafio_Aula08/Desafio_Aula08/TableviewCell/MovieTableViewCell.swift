//
//  MovieTableViewCell.swift
//  Desafio_Aula08
//
//  Created by Matheus Lenke on 16/03/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(title: String, schedule: String) {
        movieTitleLabel.text = title
        scheduleLabel.text = schedule
    }
    
}
