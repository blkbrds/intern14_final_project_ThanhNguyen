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
    
    let searchController = UISearchController(searchResultsController: nil)

    private var videos = [YouTube]()
    private var token = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SEARCH"

        searchUI()
        setupData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func searchUI() {
        tableView.register(SearchCell.self)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func setupData() {
        APIManager.YouTube.getBot(pageToken: token, maxResults: 10, keyword: "") { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let dummy):
                self.token = dummy.token
                for video in dummy.video {
                    self.videos.append(video)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: TableView Delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SearchCell.self)
        let video = videos[indexPath.row]
        cell.videoNameLabel.text = video.titleVideo
        cell.viewsLabel.text = video.publishedAt
        cell.channelNameLabel.text = video.channelTitle

        if let thumbnail = video.thumbnail {
            cell.videoImage.image = thumbnail
        } else {
            cell.videoImage.image = nil
            APIManager.Downloader.downloadImage(imageURL: video.imageStr, index: indexPath.row) { (image, index) in
                var video = self.videos[index]
                video.thumbnail = image

                let cell = tableView.cellForRow(at: indexPath) as? SearchCell
                cell?.videoImage.image = image
            }
        }
        return cell
    }

    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Load More Page
        if indexPath.row == videos.count - 3 {
            setupData()
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        let trimmedString = String(searchText.filter { !"\n\t\r".contains($0)})
        APIManager.YouTube.getBot(pageToken: "", maxResults: 25, keyword: trimmedString) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let dummy):
                self.videos = dummy.video
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
