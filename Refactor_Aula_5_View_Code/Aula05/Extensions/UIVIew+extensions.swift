//
//  UIVIew+extensions.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
    func configSubview(_ view: UIView, with constraints: [NSLayoutConstraint]) {
        addSubview(view)
            
        constraints.forEach { constraint in constraint.isActive = true }
    }
}
