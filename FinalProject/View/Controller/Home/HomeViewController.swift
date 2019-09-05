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
//                this.tableView.reloadSections(IndexSet(integer: HomeViewModel.SectionType.bolero.rawValue), with: .none)
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
//                this.tableView.reloadSections(IndexSet(integer: HomeViewModel.SectionType.nhacXuan.rawValue), with: .none)
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
//                this.tableView.reloadSections(IndexSet(integer: HomeViewModel.SectionType.nhacVang.rawValue), with: .none)
            case .failure(let error):
                this.alert(title: "", msg: error.localizedDescription, handler: nil)
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
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
            return cell
        case .channel:
            let cell = tableView.dequeue(ChannelCell.self)
            cell.viewModel = viewModel.getChannelCellModel(at: indexPath)
            return cell
        case .bolero:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getBoleroCellModel(at: indexPath)
            return cell
        case .nhacXuan:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getNhacXuanCellModel(at: indexPath)
            return cell
        case .nhacVang:
            let cell = tableView.dequeue(KindCell.self)
            cell.viewModel = viewModel.getNhacVangCellModel(at: indexPath)
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
