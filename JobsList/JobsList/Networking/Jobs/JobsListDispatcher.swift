//
//  JobsListDispatcher.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

protocol JobsListDispatcherProtocol {
    func executeRequest(_ request: JobsListRequest, refreshingCache: Bool, responseHandler: @escaping ((Response<JobsList>) -> Void))
}

struct JobsListDispatcher: JobsListDispatcherProtocol, Dispatcher {
    typealias ResponseObject = JobsList
    typealias APIRequest = JobsListRequest
}
