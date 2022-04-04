//
//  AppCoordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    //Private set para garantir que externamente só poderá ser retornado o array, e setado somente internamente
    private(set) var childCoordinator: [Coordinator] = []
    
    private(set) var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        
        childCoordinator.append(homeCoordinator)
        
        homeCoordinator.start()
    }
}
