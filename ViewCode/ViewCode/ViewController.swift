//
//  ViewController.swift
//  ViewCode
//
//  Created by Idwall Go Dev 003 on 22/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    private enum Defaults {
        static let title = "Informações gerais"
        static let labelText = "Default Text"
    }
    
    lazy var safeArea: UILayoutGuide = {
        return view.layoutMarginsGuide
    }()
    
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
        label.text = Defaults.title
        
        return label
    }()
    
    
    lazy var callButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Call View", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(getView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //button.addAction(UIAction, for: .touchUpInside)
        return button
    }()
    
    lazy var content: UIView = {
        let view = UIView()
        
        view.backgroundColor = .backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .grayViewCode
        label.text = Defaults.labelText
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        addSubViews()
        configureIconImageView()
        configureTitleLabel()
        configureCallButton()
        configureContentView()
        configureDescriptionlabel()
     
        
    }
    
    @objc func getView() {
        print("asd")
    }
    
    private func addSubViews() {
        view.addSubViews([iconImageView, titleLabel, callButton, content])
        content.addSubview(descriptionLabel)
    }
    
    private func configureIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 120),
            iconImageView.widthAnchor.constraint(equalToConstant: 120),
            iconImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor).isActive = true
    }
    
    private func configureCallButton() {
        callButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        callButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        callButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        callButton.addTarget(self, action: #selector(getView), for: .touchUpInside)
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 10),
            content.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            content.heightAnchor.constraint(equalToConstant: 130),
            content.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9)
        ])
    }

    private func configureDescriptionlabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: content.centerYAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: content.centerXAnchor)
        ])
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        title = "View Controller"
    }
}

