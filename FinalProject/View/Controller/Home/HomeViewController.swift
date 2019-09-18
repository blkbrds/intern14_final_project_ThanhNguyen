//
//  HomeViewController.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: ViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: TableView!

    // MARK: - Propeties
    private var viewModel = HomeViewModel()
    private var dispatchGroup = DispatchGroup()
    private var isLoadingAPI = false

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        updateData()
    }

    // MARK: - Private Func
    private func updateData() {
        getDataTrending()
        getDataBolero()
        getDataChannel(isLoadMore: false)
        getDataNhacVang()
        getDataNhacXuan()
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let this = self else { return }
            this.tableView.reloadData()
        }
    }

    private func configTableView() {
        tableView.register(HeaderCell.self)
        tableView.register(KindCell.self)
        tableView.register(ChannelCell.self)
        tableView.register(SectionTableView.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func getDataTrending() {
        dispatchGroup.enter()
        viewModel.getDataTrending { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
            this.dispatchGroup.leave()
        }
    }

    private func getDataChannel(isLoadMore: Bool) {
        dispatchGroup.enter()
        isLoadingAPI = true
        viewModel.getDataChannel(isLoadMore: isLoadMore) { [weak self] result in
            guard let this = self else { return }
            this.isLoadingAPI = false
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
            this.dispatchGroup.leave()
        }
    }

    private func getDataBolero() {
        dispatchGroup.enter()
        viewModel.getDataBolero { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
            this.dispatchGroup.leave()
        }
    }

    private func getDataNhacXuan() {
        dispatchGroup.enter()
        viewModel.getDataNhacXuan { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
            this.dispatchGroup.leave()
        }
    }

    private func getDataNhacVang() {
        dispatchGroup.enter()
        viewModel.getDataNhacVang { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
            this.dispatchGroup.leave()
        }
    }
}

// MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionType = HomeViewModel.SectionType(rawValue: section) else { return UIView() }
        let sectionView = tableView.dequeue(SectionTableView.self)
        sectionView.updateUI(sectionName: sectionType.title)
        return sectionView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionType = HomeViewModel.SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending:
            return HomeViewController.trendingSectionHeight
        default:
            return HomeViewController.defaultSectionHeight
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let sectionType = HomeViewModel.SectionType(rawValue: indexPath.section) else { return 0 }
        switch sectionType {
        case .trending:
            return HomeViewController.trendingCellHeight
        case .channel:
            return HomeViewController.channelCellHeight
        default:
            return HomeViewController.kindCellHeight
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = HomeViewModel.SectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        switch sectionType {
        case .trending:
            let cell = tableView.dequeue(HeaderCell.self)
            cell.viewModel = viewModel.getTrendingCellModel()
//            cell.delegate = self
            return cell
        case .channel:
            let cell = tableView.dequeue(ChannelCell.self)
            cell.viewModel = viewModel.getChannelCellModel(at: indexPath)
            return cell
        case .bolero:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getBoleroCellModel()
//            cell.delegate = self
            return cell
        case .nhacXuan:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getNhacXuanCellModel()
//            cell.delegate = self
            return cell
        case .nhacVang:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getNhacVangCellModel()
//            cell.delegate = self
            return cell
        }
    }

    // MARK: - LoadMore
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.channelResult.items.count - 3 {
            getDataChannel(isLoadMore: true)
        }
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController {
    // MARK: - HeightForRowAt
    static let trendingCellHeight: CGFloat = 200
    static let channelCellHeight: CGFloat = 60
    static let kindCellHeight: CGFloat = 80

    // MARK: - HeightForHeaderInSection
    static let trendingSectionHeight: CGFloat = 0
    static let defaultSectionHeight: CGFloat = 20
}
