//
//  ViewController.swift
//  desafio_aula_05
//
//  Created by Idwall Go Dev 003 on 13/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var memberIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Public Variables
    private var loginMock: LoginModel?
    
    //MARK: Life Cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginMock = LoginModel(memberId: 6732, password: "abcd123")
    }
    
    // MARK: IBAction Functions
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let login = getDataFromUI() {
            authenticateLogin(login)
            
            
            return
        }
        
        showAlert(message: .fieldsNullOrEmpty)
    }
    
    // MARK: Private Functions
    private func showAlert(message: MessageEnum) {
        
        let alertView = UIAlertController(title: "Authentication", message: message.rawValue, preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alertView, animated: true, completion: nil)
    }
    
    private func getDataFromUI() -> LoginModel? {
        
        if let memberIdString = memberIdTextField.text,
               !memberIdString.isEmpty,
           let password = passwordTextField.text,
               !password.isEmpty
        {
            let memberId = try! Int(memberIdString, format: .number)
            return LoginModel(memberId: memberId, password: password)
        }
        
        return nil
    }
    
    func authenticateLogin(_ loginModel: LoginModel) {
        
        if loginModel.memberId == loginMock?.memberId,
           loginModel.password == loginMock?.password
        {
            showAlert(message: .welcomeMember)
        }
        
        showAlert(message: .memberDoesntExist)
    }
}

