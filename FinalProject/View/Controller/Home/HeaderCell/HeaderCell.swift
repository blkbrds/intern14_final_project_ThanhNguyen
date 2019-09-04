//
//  HeaderCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

final class HeaderCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var collectionView: CollectionView!
    @IBOutlet private weak var pageControlView: UIPageControl!

    // MARK: - Propeties
    var viewModel = HeaderCellViewModel()

    // MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(HeaderCollectionCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self

        pageControlView.numberOfPages = viewModel.data.count
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension HeaderCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel.cellForItemAt(collectionView, at: indexPath)
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension HeaderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.collectionViewLayout()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return viewModel.collectionViewLayout()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.collectionViewLayout()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.collectionViewLayout()
    }
}
