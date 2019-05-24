//
//  NetworkError.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
    case
    noData,
    corruptedData,
    badInput,
    notReachable,
    undefined(Error)
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return NSLocalizedString("noDataError", comment: "")
        case .corruptedData:
            return NSLocalizedString("corruptedDataError", comment: "")
        case .badInput:
            return NSLocalizedString("badInputError", comment: "")
        case .notReachable:
            return NSLocalizedString("notReachableError", comment: "")
        case .undefined(let error):
            return error.localizedDescription
        }
    }
}
