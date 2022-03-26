//
//  DoneViewController.swift
//  WhatsAppScreen
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class DoneViewController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        title = "Done"
        
        view.backgroundColor = .red
    }
}
