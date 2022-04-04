//
//  HomeViewModel.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 003 on 04/04/22.
//

import Foundation

class HomeViewModel {
    
    let title = "Home"
    
    var coordinator: HomeCoordinator?
    
    func tapDetails() {
        coordinator?.goToDetails()
    }
}
