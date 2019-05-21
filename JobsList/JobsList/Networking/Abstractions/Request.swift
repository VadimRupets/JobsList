//
//  Request.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

protocol Request {
    var httpMethod: HTTPMethod { get }
    var endpoint: String { get }
    var parameters: [String: Any]? { get }
}

enum HTTPMethod: String {
    case
    get = "GET",
    post = "POST"
}
