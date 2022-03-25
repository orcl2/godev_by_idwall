//
//  LoginDefaults.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//
import UIKit

enum LoginSizeDefaults{
    case label
    case textField
    case image
    case button
        
    var heigth: CGFloat {
        get {
            return getHeigth()
        }
    }
    
    func getHeigth() -> CGFloat {
        switch self {
        case .label:
            return 40
        case .textField:
            return 45
        case .image:
            return 75
        case .button:
            return 50
        }
    }
}

enum LoginImageDefaults {
    case logo
    
    var image: UIImage? {
        get {
            return getImage()
        }
    }
    
    func getImage() -> UIImage? {
        switch self {
        case .logo:
            return UIImage(systemName: "swift")
        }
    }
}
