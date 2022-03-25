//
//  LoginLabel.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

class LoginLabel: UILabel, LoginComponentProtocol {
    
    required init(frame: CGRect, ofType groupType: LoginGroupType) {
        super.init(frame: frame)
        
        setupView(with: groupType)
    }
    
    internal func setupView(with type: LoginGroupType) {
        text = type.labelText
        font = UIFont.systemFont(ofSize: 20)
        textColor = .systemRed
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
