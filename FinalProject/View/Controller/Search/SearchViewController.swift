//
//  SearchViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

final class SearchViewController: ViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Propeties
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel = SearchViewModel()
    var isLoadingApi = false

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SEARCH"

        configUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData(isLoadMore: false)
    }

    private func getData(isLoadMore: Bool) {
        isLoadingApi = true
        viewModel.getData(isLoadMore: isLoadMore) { [weak self] result in
            guard let this = self else { return }
            this.isLoadingApi = false
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }

    private func configUI() {
        tableView.register(SearchCell.self)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResult.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SearchCell.self)
        cell.viewModel = viewModel.getSearchCellModel(at: indexPath)
        return cell
    }

    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Load More Page
        if indexPath.row == viewModel.searchResult.items.count - 3 {
            getData(isLoadMore: true)
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        let trimText = String(searchText.filter { !" \n\t\r".contains($0) })
        viewModel.searchText = trimText
        viewModel.getData(isLoadMore: false) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(msg: error.localizedDescription, handler: nil)
            }
        }
    }
}
