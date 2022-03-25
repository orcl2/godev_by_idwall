//
//  LoginTextField.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

class LoginTextField: UITextField, LoginComponentProtocol {

    required init(frame: CGRect, ofType groupType: LoginGroupType) {
        super.init(frame: frame)
        
        setupView(with: groupType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupView(with type: LoginGroupType) {
        
        self.keyboardType = type.keyboardType
        borderStyle = .roundedRect
        font = UIFont.systemFont(ofSize: 22)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
