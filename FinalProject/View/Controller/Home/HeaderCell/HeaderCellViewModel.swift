//
//  HeaderCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit
import SwiftUtils

final class HeaderCellViewModel {
    var data: [UIImage] = [#imageLiteral(resourceName: "ic-sun"), #imageLiteral(resourceName: "ic-mercury"), #imageLiteral(resourceName: "ic-saturn"), #imageLiteral(resourceName: "ic-earth"), #imageLiteral(resourceName: "ic-asteroidBelt"), #imageLiteral(resourceName: "ic-nepturn"), #imageLiteral(resourceName: "ic-jupiter"), #imageLiteral(resourceName: "ic-venus")]

    func numberOfItemsInSection() -> Int {
        return data.count
    }

    func cellForItemAt(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(HeaderCollectionCell.self, forIndexPath: indexPath)
        let image = data[indexPath.row]
        cell.viewModel = HeaderCollectionViewModel(image: image, headerName: "asdfasdfasdfasdf")
        return cell
    }

    func collectionViewLayout() -> CGSize {
        return CGSize(width: kScreenSize.width, height: 200)
    }

    func collectionViewLayout() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionViewLayout() -> CGFloat {
        return 0.0
    }
}
