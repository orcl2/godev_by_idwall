//
//  Coordinator.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinator: [Coordinator] { get }
    var navigationController: UINavigationController { get }
    
    func start()
    
}
