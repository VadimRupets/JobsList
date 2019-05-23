//
//  UIViewController+Extensions.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/23/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(with error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        
        present(alertController, animated: true)
    }
}
