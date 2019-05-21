//
//  JobsList.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

final class JobsList: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case data
    }
    
    private enum CodingKeys: String, CodingKey {
        case items
        case total
    }
    
    let jobs: [Job]
    let total: Int
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let listContainer = try rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        self.jobs = try listContainer.decode([Job].self, forKey: .items)
        self.total = try listContainer.decode(Int.self, forKey: .total)
    }
}
