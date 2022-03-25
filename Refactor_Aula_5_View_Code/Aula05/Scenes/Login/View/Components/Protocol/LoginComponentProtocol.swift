//
//  LoginComponentProtocol.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

protocol LoginComponentProtocol {
    init(frame: CGRect, ofType groupType: LoginGroupType)
    
    func setupView(with type: LoginGroupType)
}
