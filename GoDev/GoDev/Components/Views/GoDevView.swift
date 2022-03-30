//
//  GoDevView.swift
//  GoDev
//
//  Created by Idwall Go Dev 003 on 29/03/22.
//

import UIKit

public class GoDevView: UIView {

    lazy var textInfo: UILabel = {
        let label = UILabel()
        
        label.text = "Estou Centralizado"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public init(_ bg: UIColor, borderColor: UIColor) {
        super.init(frame: .zero)
        
        backgroundColor = bg
        
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 5
        self.layer.borderColor = borderColor.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTextInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextInfo() {
        addSubview(textInfo)
        
        NSLayoutConstraint.activate([
            textInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInfo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
