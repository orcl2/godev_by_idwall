//
//  LoginImageView.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class LoginImageView: UIImageView {
    
    required init(frame: CGRect, ofType groupType: LoginGroupType) {
        super.init(frame: frame)
        
        setupView(with: groupType)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupView(with type: LoginGroupType? = nil) {
        image = LoginImageDefaults.logo.image
        tintColor = .red
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
