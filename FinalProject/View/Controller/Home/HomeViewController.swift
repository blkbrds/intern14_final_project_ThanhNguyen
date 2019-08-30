//
//  HomeViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

class HomeViewController: ViewController {
    var viewModel = HomeViewModel()
    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "HOME"
        configTableView()
    }

    private func configTableView() {
        tableView.register(HeaderCell.self)
        tableView.register(ChannelCell.self)
        tableView.register(KindCell.self)
        tableView.register(HomeSectionHeaderView.self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = HomeViewModel.Section(rawValue: section) else { return UIView() }
        switch section {
        case .trending:
            return nil
        case .bolero:
            let section = tableView.dequeue(HomeSectionHeaderView.self)
            section.sectionName.text = "Bolero"
            return section
        case .nhacXuan:
            let section = tableView.dequeue(HomeSectionHeaderView.self)
            section.sectionName.text = "Nhac xuan"
            return section
        case .nhacVang:
            let section = tableView.dequeue(HomeSectionHeaderView.self)
            section.sectionName.text = "Nhac vang"
            return section
        default:
            let section = tableView.dequeue(HomeSectionHeaderView.self)
            section.sectionName.text = "Channel"
            return section
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeViewModel.Section(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .trending:
            let cell = tableView.dequeue(HeaderCell.self)
            return cell
        case .channel:
            let cell = tableView.dequeue(ChannelCell.self)
            cell.channelImage.image = #imageLiteral(resourceName: "ic-youtube")
            cell.channelLabel.text = "Super Hero"
            cell.channelDescriptionLabel.text = "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel"
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
