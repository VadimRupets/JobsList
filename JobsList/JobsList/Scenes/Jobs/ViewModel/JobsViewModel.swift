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
    case error(NetworkError)
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
    
    func fetchJobs(refreshingCache: Bool = false) {
        stateChanged?(.loading)
        
        jobsListDispatcher.executeRequest(.init(), refreshingCache: refreshingCache) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let jobsList):
                self.jobs = jobsList.jobs.map({ return JobTableViewCellModel(job: $0) })
                self.state = .jobsFetched
            case .failure(let error):
                self.state = .error(error)
            }
        }
    }
}
