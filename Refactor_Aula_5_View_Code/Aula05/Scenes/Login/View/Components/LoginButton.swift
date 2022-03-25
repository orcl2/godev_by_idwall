//
//  LoginButton.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class LoginButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = .systemRed
        setTitle("Autenticar", for: .normal)
        layer.cornerCurve = .circular
        layer.cornerRadius = 5
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
