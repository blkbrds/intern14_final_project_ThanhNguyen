//
//  KindCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

class KindCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var data: [UIImage] = [#imageLiteral(resourceName: "ic-sun"), #imageLiteral(resourceName: "ic-mercury"), #imageLiteral(resourceName: "ic-saturn"), #imageLiteral(resourceName: "ic-earth"), #imageLiteral(resourceName: "ic-asteroidBelt"), #imageLiteral(resourceName: "ic-nepturn"), #imageLiteral(resourceName: "ic-jupiter"), #imageLiteral(resourceName: "ic-venus")]

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(KindCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension KindCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(KindCollectionViewCell.self, forIndexPath: indexPath)
        let image = data[indexPath.row]
        cell.kindImage.image = image
        return cell
    }
}

extension KindCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
}
