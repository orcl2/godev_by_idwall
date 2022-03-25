//
//  LoginBackgroundImageView.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class LoginBackgroundImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        image = UIImage(named: "bg")
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
