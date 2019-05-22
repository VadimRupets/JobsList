//
//  UIView+Extensions.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var nib: UINib? { get }
}

extension NibLoadable where Self: UIView {
    static var nib: UINib? {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
}
