//
//  UIView+extensions.swift
//  ViewCode
//
//  Created by Idwall Go Dev 003 on 23/03/22.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
