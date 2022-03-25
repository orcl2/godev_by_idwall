//
//  ViewController.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 11/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: View Components
    lazy var mainStackView: LoginMainContainer = {
        let stack = LoginMainContainer(frame: .zero)
        
        return stack
    }()

    lazy var loginImageView: LoginImageView! = {
        let image = LoginImageView(frame: .zero)
        
        return image
    }()
    
    lazy var emailGroupView: LoginInputGroupView! = {
        let groupView = LoginInputGroupView(frame: .zero, ofType: .email)
                
        return groupView
    }()
    
    lazy var passwordGroupView: LoginInputGroupView! = {
        let groupView = LoginInputGroupView(frame: .zero, ofType: .password)
                
        return groupView
    }()

    // MARK: TODO -> create button component
    lazy private var autenticatorButton: UIButton! = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
        
        view.configSubview(mainStackView, with: [
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
        
        mainStackView.configArrangedSubview(loginImageView, with: [
            loginImageView.heightAnchor.constraint(equalToConstant: LoginSizeDefaults.image.heigth)
        ])
        mainStackView.configArrangedSubview(emailGroupView, with: [])
        mainStackView.configArrangedSubview(passwordGroupView, with: [])
    }
    
    // MARK: Private methods
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
