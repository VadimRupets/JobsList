//
//  UITableViewCell+Extensions.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
