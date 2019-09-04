//
//  HomeViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

final class HomeViewController: ViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Propeties
    var viewModel = HomeViewModel()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "HOME"
        configTableView()
    }

    // MARK: Private func
    private func configTableView() {
        tableView.register(HeaderCell.self)
        tableView.register(ChannelCell.self)
        tableView.register(KindCell.self)
        tableView.register(HomeSectionHeaderView.self)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionType = HomeViewModel.SectionType(rawValue: section) else { return UIView() }
        let headerView = tableView.dequeue(HomeSectionHeaderView.self)
        headerView.updateUI(sectionName: sectionType.title)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = HomeViewModel.SectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        switch sectionType {
        case .trending:
            let cell = tableView.dequeue(HeaderCell.self)
            return cell
        case .channel:
            let cell = tableView.dequeue(ChannelCell.self)
            cell.viewModel = viewModel.getChannelCellModel(at: indexPath)
            return cell
        default:
            let cell = tableView.dequeue(KindCell.self)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(at: indexPath)
    }
}
