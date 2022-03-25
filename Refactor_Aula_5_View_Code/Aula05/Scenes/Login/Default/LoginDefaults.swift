//
//  LoginDefaults.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//
import UIKit

enum LoginDefaults: CGFloat {
    case label
    case textField
    
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
            return 55
        }
    }
}
