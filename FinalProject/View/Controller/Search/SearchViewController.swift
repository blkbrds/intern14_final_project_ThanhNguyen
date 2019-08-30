//
//  SearchViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

class SearchViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 305, height: 20))
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        let leftNavBar = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBar
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidClick))
        navigationItem.rightBarButtonItem = cancelButton
    }

    @objc private func cancelButtonDidClick() {
        self.title = "SEARCH"
    }
}

extension SearchViewController: UISearchBarDelegate {

}
