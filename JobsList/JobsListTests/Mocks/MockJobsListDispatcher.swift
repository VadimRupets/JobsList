//
//  MockJobsListDispatcher.swift
//  JobsListTests
//
//  Created by Vadzim Rupets on 5/24/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

@testable import JobsList

class SuccessJobsListDispatcher: JobsListDispatcherProtocol {
    let jobsList: JobsList = {
        let address1 = Address(street: "Street 1", zip: "12345AB", city: "London")
        let address2 = Address(street: "Street 2", zip: "54321BA", city: "London")
        
        let job1 = Job(name: "Bartender", address: address1)
        let job2 = Job(name: "Waiter", address: address2)
        let jobs = [job1, job2]
        
        return JobsList(jobs: jobs, total: jobs.count)
    }()
    
    func executeRequest(_ request: JobsListRequest, refreshingCache: Bool, responseHandler: @escaping ((Result<JobsList, NetworkError>) -> Void)) {
        responseHandler(.success(jobsList))
    }
}

class FailureJobsListDispatcher: JobsListDispatcherProtocol {
    let error = NetworkError.noData
    
    func executeRequest(_ request: JobsListRequest, refreshingCache: Bool, responseHandler: @escaping ((Result<JobsList, NetworkError>) -> Void)) {
        responseHandler(.failure(error))
    }
}
