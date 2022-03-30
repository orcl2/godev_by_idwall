//
//  ViewController.swift
//  GoDevDemo
//
//  Created by Idwall Go Dev 003 on 29/03/22.
//

import UIKit
import GoDev

class ViewController: UIViewController {

    lazy var button: GoDevButton = {
        let config = GoDevButton.Config.light()
        let button = GoDevButton(config: config)
        
        button.setTitle("Favorite", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var content: GoDevView = {
        let view = GoDevView(UIColor.systemIndigo, borderColor: UIColor.red)
                
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "DEMO"
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        view.addSubview(content)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            content.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            content.heightAnchor.constraint(equalToConstant: 200)
        ])

    }


}

