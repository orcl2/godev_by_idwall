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
        
        return stack
    }()

    lazy var loginImageView: LoginImageView! = {
        let image = LoginImageView(frame: .zero)
        
        return image
    }()

    lazy private var autenticatorButton: UIButton! = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var emailGroupView: LoginGroupView! = {
        let groupView = LoginGroupView(frame: .zero, ofType: .email)
                
        return groupView
    }()
    
    lazy var passwordGroupView: LoginGroupView! = {
        let groupView = LoginGroupView(frame: .zero, ofType: .password)
                
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
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        

        contentStackView.configArrangedSubview(loginImageView, with: [
            loginImageView.heightAnchor.constraint(equalToConstant: LoginSizeDefaults.image.heigth)
        ])
        
        contentStackView.addArrangedSubviews([
            emailGroupView,
            passwordGroupView
        ])
    }
    
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
