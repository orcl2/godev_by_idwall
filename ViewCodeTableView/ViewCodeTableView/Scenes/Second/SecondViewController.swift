//
//  SecondViewController.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class SecondViewController: UIViewController {

    var idProduct: String?
    
    lazy var closeButton: UIButton!  = {
        let button = UIButton(type: .close)
        
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second"
        view.backgroundColor = .lightGray
        
        if let id = idProduct {
            print(id)
        }
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}
