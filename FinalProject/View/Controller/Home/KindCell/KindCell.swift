//
//  KindCell.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

final class KindCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: CollectionView!

    // MARK: - Propeties
    var viewModel = KindCellViewModel() {
        didSet {
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(KindCollectionCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionView Delegate, DataSource
extension KindCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
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

// MARK: - CollectionView Delegate FlowLayout
extension KindCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 60)
    }
}
