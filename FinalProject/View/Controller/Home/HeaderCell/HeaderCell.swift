//
//  HeaderCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils

class HeaderCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControlView: UIPageControl!

    var timer = Timer()
    var counter = 0

    var data: [UIImage] = [#imageLiteral(resourceName: "ic-sun"), #imageLiteral(resourceName: "ic-mercury"), #imageLiteral(resourceName: "ic-saturn"), #imageLiteral(resourceName: "ic-earth"), #imageLiteral(resourceName: "ic-asteroidBelt"), #imageLiteral(resourceName: "ic-nepturn"), #imageLiteral(resourceName: "ic-jupiter"), #imageLiteral(resourceName: "ic-venus")]
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(HeaderCollectionCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self

        pageControlView.numberOfPages = data.count
        pageControlView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }

    @objc private func changeImage() {
        if counter < data.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControlView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControlView.currentPage = counter
            counter = 1
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension HeaderCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(HeaderCollectionCell.self, forIndexPath: indexPath)
        let image = data[indexPath.row]
        cell.viewModel = HeaderCollectionViewModel(image: image, label: "ABC123123123")
        return cell
    }
}

extension HeaderCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenSize.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
