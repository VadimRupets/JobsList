//
//  HTTPURLResponse+Extensions.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    open override var description: String {
        return """
        
        Request response
        URL: \(url?.absoluteString ?? "")
        Status Code: \(statusCode)
        """
    }
}
