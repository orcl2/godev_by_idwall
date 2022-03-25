//
//  LoginMainGroup.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class LoginMainContainer: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        spacing = 10
        axis = .vertical
        contentMode = .top
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
