//
//  JobsViewModelTests.swift
//  JobsListTests
//
//  Created by Vadzim Rupets on 5/24/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import JobsList

class JobsViewModelTests: XCTestCase {
    
    func testViewModelFetchingJobsUsingSuccessJobsListDispatcher() {
        let loadingExpectation = expectation(description: "Switched to loading state")
        let successExpectation = expectation(description: "Switched to jobsFetched state")
        let errorExpectation = expectation(description: "Switched to error state")
        errorExpectation.isInverted = true
        
        // Given: JobsViewModel and SuccessJobsListDispatcher
        let successDispatcher = SuccessJobsListDispatcher()
        let viewModel = JobsViewModel(jobsListDispatcher: successDispatcher)
        
        // When: viewModel fetches jobs list
        var returnedError: NetworkError?
        var viewModelJobCellModels = [JobTableViewCellModel]()
        viewModel.stateChanged = { state in
            switch state {
            case .loading:
                loadingExpectation.fulfill()
            case .error(let error):
                returnedError = error
                errorExpectation.fulfill()
            case .jobsFetched:
                viewModelJobCellModels = viewModel.jobs
                successExpectation.fulfill()
            }
        }
        
        viewModel.fetchJobs()
        
        // Then: viewModel parsed response into array of JobTableViewCellModel
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertFalse(viewModelJobCellModels.isEmpty)
        XCTAssertNil(returnedError)
    }
    
    func testViewModelFetchingJobsUsingFailureJobsListDispatcher() {
        let loadingExpectation = expectation(description: "Switched to loading state")
        let errorExpectation = expectation(description: "Switched to error state")
        let successExpectation = expectation(description: "Switched to jobsFetched state")
        successExpectation.isInverted = true
        
        // Given: JobsViewModel and FailureJobsListDispatcher
        let successDispatcher = FailureJobsListDispatcher()
        let viewModel = JobsViewModel(jobsListDispatcher: successDispatcher)
        
        // When: viewModel fetches jobs list
        var returnedError: NetworkError?
        var viewModelJobCellModels = [JobTableViewCellModel]()
        viewModel.stateChanged = { state in
            switch state {
            case .loading:
                loadingExpectation.fulfill()
            case .error(let error):
                returnedError = error
                errorExpectation.fulfill()
            case .jobsFetched:
                viewModelJobCellModels = viewModel.jobs
                successExpectation.fulfill()
            }
        }
        
        viewModel.fetchJobs()
        
        // Then: viewModel received NetworkError
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModelJobCellModels.isEmpty)
        XCTAssertNotNil(returnedError)
    }
    
}
