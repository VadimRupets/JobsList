//
//  Coordinator.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/23/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
}
