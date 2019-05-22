//
//  UITableView+Extensions.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) where T: Reusable & NibLoadable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellClass: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T
            else {
                fatalError(
                    "Failed to dequeue cell with identifier \(cellClass.reuseIdentifier) with type \(cellClass.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand"
                )
        }
        return cell
    }
}
