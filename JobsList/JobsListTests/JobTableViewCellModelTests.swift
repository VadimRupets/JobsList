//
//  JobTableViewCellModelTests.swift
//  JobsListTests
//
//  Created by Vadzim Rupets on 5/24/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import JobsList

class JobTableViewCellModelTests: XCTestCase {
    
    func testJobTableViewCellInitialization() {
        // Given: Job object
        let address = Address(street: "Street", zip: "12345AB", city: "London")
        let job = Job(name: "Bartender", address: address)
        
        // When: JobTableViewCell is initialized with given job
        let cellModel = JobTableViewCellModel(job: job)
        
        // Then: all cellModels properties are set correctly
        XCTAssertEqual(cellModel.name, job.name)
        XCTAssertEqual(cellModel.street, job.address.street)
        XCTAssertEqual(cellModel.zip, job.address.zip)
        XCTAssertEqual(cellModel.city, job.address.city)
    }
    
}
