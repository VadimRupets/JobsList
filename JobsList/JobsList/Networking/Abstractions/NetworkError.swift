//
//  NetworkError.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case
    noData,
    corruptedData,
    badInput,
    notReachable
    
    var localizedDescription: String {
        switch self {
        case .noData:
            return "Server returned no data"
        case .corruptedData:
            return "Returned data is corrupted and can't be read"
        case .badInput:
            return "You sent a request that server could not understand"
        case .notReachable:
            return "Can not connect to server. Please check your internet connection"
        }
    }
}
