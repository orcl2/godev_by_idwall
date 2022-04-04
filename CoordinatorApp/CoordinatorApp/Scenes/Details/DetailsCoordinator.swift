//
//  DetailsCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import Foundation
import UIKit

class DetailsCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
    private(set) var navigationController: UINavigationController
    
    var parentCoordinator: HomeCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = DetailsViewController()
        let viewModel = DetailsViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        
        // Opção
        //navigationController.present(viewController, animated: true, completion: nil)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
