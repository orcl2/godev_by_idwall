//
//  EmailGroup.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

class LoginInputGroupView: UIStackView {

    var groupType: LoginGroupType!
    
    lazy var label: LoginLabel! = {
        let label = LoginLabel(frame: .zero, ofType: groupType)
        
        return label
    }()
    
    lazy var textField: LoginTextField! = {
        let textField = LoginTextField(frame: .zero, ofType: groupType)
        
        return textField
    }()
    
    init(frame: CGRect, ofType groupType: LoginGroupType) {
        super.init(frame: frame)
        
        self.groupType = groupType
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
   
        configArrangedSubview(label, with: [
            label.heightAnchor.constraint(equalToConstant: LoginSizeDefaults.label.heigth)
        ])
        
        configArrangedSubview(textField, with: [
            textField.heightAnchor.constraint(equalToConstant: LoginSizeDefaults.textField.heigth),
            textField.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}

