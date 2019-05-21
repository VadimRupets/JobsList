//
//  JobsListRequest.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

struct JobsListRequest: Request {
    let pageNumber: Int
    let pageSize: Int
    
    init(pageNumber: Int = 0, pageSize: Int = 200) {
        self.pageNumber = pageNumber
        self.pageSize = pageSize
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "work-assignments/public-jobs/list"
    }
    
    var parameters: [String : Any]? {
        return ["pageNum": pageNumber, "pageSize": pageSize]
    }
}
