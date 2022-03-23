//
//  ViewController.swift
//  ViewCode
//
//  Created by Idwall Go Dev 003 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: "swift")
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .systemTeal
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Icon Label"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        
        //Setando constraints primaira forma
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 120),
            iconImageView.widthAnchor.constraint(equalToConstant: 120),
            iconImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
        //Setando constraints segunda forma
        iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor).isActive = true
        
        title = "View Controller"
    }
}

