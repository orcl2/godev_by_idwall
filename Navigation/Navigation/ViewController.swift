//
//  ViewController.swift
//  Navigation
//
//  Created by Idwall Go Dev 003 on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
    }

    @IBAction func goToNextView(_ sender: UIButton) {
        
        let sender = Data(name: "William Daniel", age: 29)
        performSegue(withIdentifier: "goToSecondViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondViewController" {
            
            guard let secondViewController = segue.destination as? SecondViewController else { return }
            
            secondViewController.property = sender as? Data
        }
    }
}

