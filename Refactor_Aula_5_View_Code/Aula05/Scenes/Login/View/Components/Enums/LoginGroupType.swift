//
//  LoginGroupType.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import Foundation
import UIKit

enum LoginGroupType {
    case email
    case password
    
    var keyboardType: UIKeyboardType {
        get {
            return textFieldKeyboardType()
        }
    }
    
    var labelText: String {
        get {
            return fieldLabel()
        }
    }
    
    func textFieldKeyboardType() -> UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        case .password:
            return .phonePad
        }
    }
    
    func fieldLabel() -> String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        }
    }
}

