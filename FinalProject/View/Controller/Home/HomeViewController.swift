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
    var viewModel = HomeViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        updateData()

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Private Func

    private func updateData() {
        getDataTrending()
        getDataBolero()
        getDataChannel()
        getDataNhacVang()
        getDataNhacXuan()
    }

    private func registerTableView() {
        tableView.register(HeaderCell.self)
        tableView.register(KindCell.self)
        tableView.register(ChannelCell.self)
        tableView.register(SectionTableView.self)
        tableView.delegate = self
        tableView.dataSource = self
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
        if indexPath.row == viewModel.trendingResult.items.count - 1 {
            getDataTrending()
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
