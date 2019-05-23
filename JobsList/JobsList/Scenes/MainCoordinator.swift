//
//  MainCoordinator.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/23/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let jobsViewController = JobsViewController.instantiate()
        let viewModel = JobsViewModel(jobsListDispatcher: JobsListDispatcher())
        jobsViewController.viewModel = viewModel
        
        navigationController.pushViewController(jobsViewController, animated: true)
    }
}
