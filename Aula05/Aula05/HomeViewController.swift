//
//  ViewController.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 11/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var autenticatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func authenticate(_ sender: UIButton) {
        
        if let email = emailTextField.text,
           let password = passwordTextField.text
        {
            print("Email: \(email)")
            print("Senha: \(password)")
        }
        
        showAlert("Email e/ou Senha inválidos.")
    }
    
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
}

