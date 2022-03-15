//
//  SpecificationTableViewCell.swift
//  Desafio_Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

class SpecificationTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    static let identifier = "SpecificationTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
