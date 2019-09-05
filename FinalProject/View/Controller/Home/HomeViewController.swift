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
        registerTableView()

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataChannel()
        getDataBolero()
        getDataNhacXuan()
        getDataNhacVang()
        getDataTrending()
    }

    // MARK: Private func
    private func registerTableView() {
        tableView.register(HeaderCell.self)
        tableView.register(ChannelCell.self)
        tableView.register(KindCell.self)
        tableView.register(HomeSectionHeaderView.self)
    }

    private func getDataChannel() {
        viewModel.getDataChannel { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }

    private func getDataBolero() {
        viewModel.getDataBolero { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }

    private func getDataNhacXuan() {
        viewModel.getDataNhacXuan { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }

    private func getDataTrending() {
        viewModel.getDataTrending { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }

    private func getDataNhacVang() {
        viewModel.getDataNhacVang { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionType = HomeViewModel.SectionType(rawValue: section) else { return UIView() }
        let sectionView = tableView.dequeue(HomeSectionHeaderView.self)
        sectionView.updateUI(sectionName: sectionType.title)
        return sectionView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionType = HomeViewModel.SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending:
            return 0
        default:
            return 20
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = HomeViewModel.SectionType(rawValue: indexPath.section) else { return UITableViewCell() }

        switch sectionType {
        case .trending:
            let cell = tableView.dequeue(HeaderCell.self)
            cell.viewModel = viewModel.getTrendingCellModel()
            cell.delegate = self
            return cell
        case .channel:
            let cell = tableView.dequeue(ChannelCell.self)
            cell.viewModel = viewModel.getChannelCellModel(at: indexPath)
            return cell
        case .bolero:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getBoleroCellModel()
            cell.delegate = self
            return cell
        case .nhacXuan:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getNhacXuanCellModel()
            cell.delegate = self
            return cell
        case .nhacVang:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getNhacVangCellModel()
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let sectionType = HomeViewModel.SectionType(rawValue: indexPath.section) else { return 0 }
        switch sectionType {
        case .trending:
            return 200
        case .channel:
            return 100
        default:
            return 80
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.channelResult.items.count - 3 {
            getDataChannel()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileViewController()
        vc.viewModel = ProfileViewModel(id: viewModel.channelResult.items[indexPath.row].id)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: HeaderCellDelegate {
    func cell(_ view: HeaderCell, needPerformAction action: HeaderCell.Action) {
        switch action {
        case .didSelectItem(let index):
            let vc = ProfileViewController()
            vc.viewModel = ProfileViewModel(id: viewModel.trendingResult.items[index].id)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: KindCellDelegate {
    func cell(_ view: KindCell, needPerformAction action: KindCell.Action, needType type: KindCellViewModel.KindType) {
        switch action {
        case .didSelectItem(let index):
            let vc = ProfileViewController()
            switch type {
            case .bolero:
                vc.viewModel = ProfileViewModel(id: viewModel.boleroResult.items[index].id)
            case .nhacXuan:
                vc.viewModel = ProfileViewModel(id: viewModel.xuanResult.items[index].id)
            case .nhacVang:
                vc.viewModel = ProfileViewModel(id: viewModel.vangResult.items[index].id)
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
