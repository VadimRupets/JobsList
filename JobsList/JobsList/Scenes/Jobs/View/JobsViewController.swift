//
//  JobsTableViewController.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    var viewModel: JobsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = JobsViewModel(jobsListDispatcher: JobsListDispatcher())
        
        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(cellClass: JobTableViewCell.self)
    }
    
    private func bindViewModel() {
        viewModel.stateChanged = { [weak self] state in
            switch state {
            case .loading:
                break
            case .jobsFetched:
                self?.tableView.reloadData()
            case .error(let error):
                break
            case .noData:
                break
            }
        }
        
        viewModel.fetchJobs()
    }

}

// MARK: - Table view data source
extension JobsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellClass: JobTableViewCell.self)
        cell.bind(viewModel: viewModel.jobs[indexPath.row])
        
        return cell
    }
    
}
