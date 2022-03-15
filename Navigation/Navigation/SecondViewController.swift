//
//  SecondViewController.swift
//  Navigation
//
//  Created by Idwall Go Dev 003 on 15/03/22.
//

import UIKit

struct Data {
    var name: String
    var age: Int
}

class SecondViewController: UIViewController {

    var property: Data?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let property = property {
            print(property.name)
            print(property.age)
        }
    }

}
