//
//  ViewController.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 11/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: View Components
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.spacing = 10
        stack.axis = .vertical
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .yellow
        
        return stack
    }()
//
//    lazy var emailStackView: UIStackView = {
//        let stack = UIStackView()
//
//        stack.spacing = 10
//        stack.axis = .vertical
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.backgroundColor = .red
//        return stack
//    }()
//
//    lazy var emailLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "Email"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .label
//        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    lazy private var emailTextField: UITextField! = {
//        let textField = UITextField()
//
//        //TODO
//        textField.keyboardType = .emailAddress
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        return textField
//    }()
    
//    lazy var passwordStackView: UIStackView = {
//        let stack = UIStackView()
//
//        stack.spacing = 10
//        stack.axis = .vertical
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.backgroundColor = .red
//        return stack
//    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "swift")
        image.tintColor = .red
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
//
//    lazy var passwordLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "Password"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .label
//        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    lazy private var passwordTextField: UITextField! = {
//        let textField = UITextField()
//
//        //TODO
//        textField.keyboardType = .numberPad
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        return textField
//    }()
    
    lazy private var autenticatorButton: UIButton! = {
        let button = UIButton()
        
        //TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var emailGroupView: LoginGroupView! = {
        let groupView = LoginGroupView(frame: .zero, ofType: .email)
        
        groupView.translatesAutoresizingMaskIntoConstraints = false
        
        return groupView
    }()
    
    lazy var passwordGroupView: LoginGroupView! = {
        let groupView = LoginGroupView(frame: .zero, ofType: .password)
        
        groupView.translatesAutoresizingMaskIntoConstraints = false
        
        return groupView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        delegates()
    }

    // MARK: Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubviews([contentStackView])
        
        configContentStackView()
    }
    
    // MARK: Private methods
    private func configContentStackView() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        

        contentStackView.addArrangedSubviews([
            iconImageView,
            emailGroupView,
            passwordGroupView
        ])
       
        configIconImageView()
        //configEmailStackView()
        //configEmailGroupView()
        //configPasswordStackView()
    }
    
    private func configIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 120),
            iconImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configEmailGroupView() {
     
    }

//    private func configEmailStackView() {
//        emailStackView.addArrangedSubview(emailLabel)
//        emailStackView.addArrangedSubview(emailTextField)
//
//        configEmailLabel()
//        configEmailTextField()
//    }

//    private func configEmailLabel() {
//        NSLayoutConstraint.activate([
//            emailLabel.widthAnchor.constraint(equalTo: emailStackView.widthAnchor)
//        ])
//    }
//
//    private func configEmailTextField() {
//        NSLayoutConstraint.activate([
//            emailTextField.heightAnchor.constraint(equalToConstant: 55),
//            emailTextField.widthAnchor.constraint(equalTo: emailStackView.widthAnchor)
//        ])
//    }
//
//    private func configPasswordStackView() {
//        passwordStackView.addArrangedSubview(passwordTextField)
//    }
//
    
    private func delegates() {
        emailGroupView.textField.delegate = self
        passwordGroupView.textField.delegate = self
    }
    
    // MARK: Public Methods
    func showAlert(_ message: String) {
        
        let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            print("Clicou no confirmar")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
            print("Clicou no cancelar")
        }))
        
        alert.addAction(UIAlertAction(title: "Destruir", style: .destructive, handler: { action in
            print("Clicou no destruir")
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Action Methods
    @objc func authenticate(_ sender: UIButton) {
        
        if let email = emailGroupView.textField.text,
           let password = passwordGroupView.textField.text
        {
            print("Email: \(email)")
            print("Senha: \(password)")
        }
        
        showAlert("Email e/ou Senha inválidos.")
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
