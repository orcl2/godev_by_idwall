//
//  ViewController.swift
//  AppUserDefaults
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import UIKit

class ViewController: UIViewController {

    private let defaults = UserDefaults.standard
    
    lazy var setValueButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.tintColor = .label
        button.setTitle("Set Value", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(setUserDefaults), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var getValueButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.tintColor = .label
        button.setTitle("Get Value", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(getUserDefaults), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        view.backgroundColor = .systemBackground
        
        view.addSubview(setValueButton)
        view.addSubview(getValueButton)
        
        NSLayoutConstraint.activate([
            setValueButton.widthAnchor.constraint(equalToConstant: 100),
            setValueButton.heightAnchor.constraint(equalToConstant: 45),
            setValueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            setValueButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            getValueButton.widthAnchor.constraint(equalToConstant: 100),
            getValueButton.heightAnchor.constraint(equalToConstant: 45),
            getValueButton.topAnchor.constraint(equalTo: setValueButton.bottomAnchor, constant: 15),
            getValueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

        ])
    }
    
    @objc private func setUserDefaults() {
        defaults.set("Internacional", forKey: "Time")
        
    }

    @objc private func getUserDefaults() {
        let team = defaults.value(forKey: "Time")
        
        if let team = team {
            print(team)
        }
    }

}

