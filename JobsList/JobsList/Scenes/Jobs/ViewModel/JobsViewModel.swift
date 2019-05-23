//
//  JobsViewModel.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

enum JobsViewModelState {
    case loading
    case jobsFetched
    case error(Error)
}

class JobsViewModel {
    
    private var state: JobsViewModelState = .jobsFetched {
        didSet {
            DispatchQueue.main.async {
                self.stateChanged?(self.state)
            }
        }
    }
    
    var stateChanged: ((JobsViewModelState) -> Void)?
    
    let jobsListDispatcher: JobsListDispatcherProtocol
    var jobs: [JobTableViewCellModel] = []
    
    init(jobsListDispatcher: JobsListDispatcherProtocol) {
        self.jobsListDispatcher = jobsListDispatcher
    }
    
    func fetchJobs() {
        stateChanged?(.loading)
        
        jobsListDispatcher.executeRequest(.init()) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .data(let jobsList):
                self.jobs = jobsList.jobs.map({ return JobTableViewCellModel(job: $0) })
                self.state = .jobsFetched
            case .error(let error):
                self.state = .error(error)
            }
        }
    }
}
