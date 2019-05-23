//
//  JobsTableViewController.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/22/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak private var noJobsView: UIView!
    @IBOutlet weak private var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    var viewModel: JobsViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindViewModel()
    }
    
    // MARK: - TableView setup
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(cellClass: JobTableViewCell.self)
        tableView.backgroundView = noJobsView
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshJobs), for: .valueChanged)
    }
    
    @objc private func refreshJobs() {
        viewModel.fetchJobs(refreshingCache: true)
    }
    
    private func bindViewModel() {
        viewModel.stateChanged = { [weak self] state in
            guard let self = self else { return }
            
            ActivityIndicator.hide()
            self.refreshControl.endRefreshing()
            
            switch state {
            case .loading:
                ActivityIndicator.show()
            case .jobsFetched:
                self.tableView.reloadData()
            case .error(let error):
                self.presentAlert(with: error)
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
