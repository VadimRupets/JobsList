//
//  Storyboarded.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/23/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
