//
//  ViewController.swift
//  TestNavigationSchemes
//
//  Created by Idwall Go Dev 003 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "App 1"
        view.backgroundColor = .systemYellow
    }

    @IBAction func button(_ sender: UIButton) {
        
        let customUrl = "NavigationSchemes://home/"
        
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

