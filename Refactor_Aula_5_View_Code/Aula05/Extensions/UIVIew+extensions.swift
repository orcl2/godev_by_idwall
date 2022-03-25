//
//  UIVIew+extensions.swift
//  Aula05
//
//  Created by Idwall Go Dev 003 on 24/03/22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.map { self.addSubview($0) }
    }
    
}
