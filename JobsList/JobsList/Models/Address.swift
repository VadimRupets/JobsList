//
//  Address.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

struct Address: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case street = "addressStreet"
        case zip
        case city
    }
    
    let street: String
    let zip: String
    let city: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.street = try container.decode(String.self, forKey: .street)
        self.zip = try container.decode(String.self, forKey: .zip)
        self.city = try container.decode(String.self, forKey: .city)
    }
}
