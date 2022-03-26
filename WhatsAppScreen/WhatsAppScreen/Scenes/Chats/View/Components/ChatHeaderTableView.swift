//
//  ChatHeaderTableView.swift
//  WhatsAppScreen
//
//  Created by Idwall Go Dev 003 on 26/03/22.
//

import UIKit

class ChatHeaderTableView: UITableViewHeaderFooterView {
    
    static let identifier = "ChatHeaderTableView"
    
    lazy var broadcastListsButton: UIButton! = {
        let button = UIButton(type: .system)
        
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 22)
        button.setTitle("Broadcast Lists", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var newGroupButton: UIButton! = {
        let button = UIButton(type: .system)
        
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 22)
        button.titleLabel?.textAlignment = .right
        button.setTitle("New Group", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {

        addSubview(headerStackView)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        headerStackView.addArrangedSubview(broadcastListsButton)
        headerStackView.addArrangedSubview(newGroupButton)
    }
}
