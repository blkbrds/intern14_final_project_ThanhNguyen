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
    @IBOutlet private weak var collectionView: CollectionView!
    var viewModel = KindCellViewModel()

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
        return viewModel.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel.cellForItemAt(collectionView, at: indexPath)
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension KindCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt()
    }
}
