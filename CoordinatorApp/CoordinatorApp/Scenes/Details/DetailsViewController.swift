//
//  DetailsViewController.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel?.title
        view.backgroundColor = .red
    }
    
}
