//
//  HeaderCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

final class HeaderCell: TableCell {

    // MARK: - Outlets
    @IBOutlet private weak var collectionView: CollectionView!
    @IBOutlet private weak var pageControlView: UIPageControl!

    // MARK: - Propeties
    var viewModel = HeaderCellViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()

        configUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        getData()
    }

    // MARK: Get API
    private func getData() {
        viewModel.getData { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func configUI() {
        collectionView.register(HeaderCollectionCell.self)
        pageControlView.numberOfPages = 5
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension HeaderCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(HeaderCollectionCell.self, forIndexPath: indexPath)
        cell.viewModel = viewModel.getHeaderCellModel(at: indexPath)
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
}
