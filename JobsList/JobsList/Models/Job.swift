//
//  Job.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

struct Job: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case name = "workAssignmentName"
        case address = "jobLocation"
    }
    
    let name: String
    let address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.address = try container.decode(Address.self, forKey: .address)
    }
}
