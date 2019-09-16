//
//  HeaderCell.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

protocol HeaderCellDelegate: class {
    func cell(_ view: HeaderCell, needPerformAction action: HeaderCell.Action)
}

final class HeaderCell: TableCell {

    enum Action {
        case didSelectItem(Int)
    }

    // MARK: - Outlet
    @IBOutlet private weak var collectionView: CollectionView!

    var viewModel = HeaderCellViewModel() {
        didSet {
            collectionView.reloadData()
        }
    }

    weak var delegate: HeaderCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    // MARK: - Register CollectionView
    private func configCollectionView() {
        collectionView.register(HeaderCollectionCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionView DataSource
extension HeaderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(HeaderCollectionCell.self, forIndexPath: indexPath)
        cell.viewModel = viewModel.getTrendingCellModel(at: indexPath)
        return cell
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension HeaderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenSize.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.cell(self, needPerformAction: .didSelectItem(indexPath.row))
        }
    }
}
