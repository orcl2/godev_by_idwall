//
//  HomeCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let viewController = HomeViewController()
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
     
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func goToDetails() {
        
        let detailCoordinator = DetailsCoordinator(navigationController: navigationController)
        detailCoordinator.parentCoordinator = self
        childCoordinator.append(detailCoordinator)
        
        detailCoordinator.start()
        
    }
}
