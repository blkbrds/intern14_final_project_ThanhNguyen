//
//  KindCell.swift
//  FinalProject
//
//  Created by MBA0158 on 9/17/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

// MARK: Delegate
protocol KindCellDelegate: class {
    func cell(_ view: KindCell, needPerformAction action: KindCell.Action, needType type: KindCellViewModel.KindType)
}

final class KindCell: TableCell {
    enum Action {
        case didSelectItem(Int)
    }

    // MARK: - Propeties
    var viewModel = KindCellViewModel() {
        didSet {
            collectionView.reloadData()
        }
    }

    weak var delegate: KindCellDelegate?

    // MARK: - Outlet
    @IBOutlet private weak var collectionView: CollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    private func configCollectionView() {
        collectionView.register(KindCollectionCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDataSource
extension KindCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(KindCollectionCell.self, forIndexPath: indexPath)
        switch viewModel.kindType {
        case .bolero:
            cell.viewModel = viewModel.getBoleroCellModel(at: indexPath)
            return cell
        case .nhacXuan:
            cell.viewModel = viewModel.getNhacXuanCellModel(at: indexPath)
            return cell
        case .nhacVang:
            cell.viewModel = viewModel.getNhacVangCellModel(at: indexPath)
            return cell
        }
    }
}

// MARK: - CollectionView DelegateFlowLayout
extension KindCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return KindCell.sizeForItem
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.cell(self, needPerformAction: .didSelectItem(indexPath.row), needType: viewModel.kindType)
        }
    }
}

extension KindCell {
    static let sizeForItem: CGSize = CGSize(width: 100, height: 60)
}
