//
//  JobTableViewCell.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var streetLabel: UILabel!
    @IBOutlet weak private var zipLabel: UILabel!
    @IBOutlet weak private var cityLabel: UILabel!
    
    func bind(viewModel: JobTableViewCellModel) {
        nameLabel.text = viewModel.name
        streetLabel.text = viewModel.street
        zipLabel.text = viewModel.zip
        cityLabel.text = viewModel.city
    }
    
}
