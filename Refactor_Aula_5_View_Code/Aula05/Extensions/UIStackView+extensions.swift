//
//  UIStackView+extensions.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
    
    func configArrangedSubview(_ view: UIView, with constraints: [NSLayoutConstraint]) {
        addArrangedSubview(view)
            
        constraints.forEach { constraint in constraint.isActive = true }
    }
    
}
