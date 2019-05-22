//
//  JobTableViewCellModel.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

struct JobTableViewCellModel {
    let name: String
    let street: String
    let zip: String
    let city: String
    
    init(job: Job) {
        name = job.name
        street = job.address.street
        zip = job.address.zip
        city = job.address.city
    }
}
