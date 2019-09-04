//
//  SearchViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

class SearchViewController: ViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Propeties
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SEARCH"
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        searchUI()
        viewModel.setupData()
    }

    private func searchUI() {
        tableView.register(SearchCell.self)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SearchCell.self)
        cell.viewModel = viewModel.getSearchCellModel(at: indexPath)
        return cell
    }

    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Load More Page
        if indexPath.row == viewModel.videos.count - 3 {
            viewModel.setupData()
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        let trimmedString = String(searchText.filter { !"\n\t\r".contains( $0)})
        APIManager.YouTube.getBot(pageToken: "", maxResults: 25, keyword: trimmedString) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let dummy):
                self.viewModel.videos = dummy.video
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
