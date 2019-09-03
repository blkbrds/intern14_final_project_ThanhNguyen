//
//  KindCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import SwiftUtils

final class KindCellViewModel {
    // MARK: - Propeties
    var data: [UIImage] = [#imageLiteral(resourceName: "ic-sun"), #imageLiteral(resourceName: "ic-mercury"), #imageLiteral(resourceName: "ic-saturn"), #imageLiteral(resourceName: "ic-earth"), #imageLiteral(resourceName: "ic-asteroidBelt"), #imageLiteral(resourceName: "ic-nepturn"), #imageLiteral(resourceName: "ic-jupiter"), #imageLiteral(resourceName: "ic-venus")]

    func cellForItemAt(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(KindCollectionCell.self, forIndexPath: indexPath)
        let image = data[indexPath.row]
        cell.viewModel = KindCollectionCellViewModel(image: image, kindLabel: "aasdfasdf")
        return cell
    }

    func sizeForItemAt() -> CGSize {
        return CGSize(width: 100, height: 60)
    }
}
