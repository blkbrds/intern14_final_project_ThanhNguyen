//
//  KindCollectionViewCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class KindCollectionCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var kindImage: ImageView!
    @IBOutlet private weak var kindLabel: Label!

    var viewModel: KindCollectionCellViewModel? {
        didSet {
            updateCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateCell() {
        guard let viewModel = viewModel else { return }
        kindImage.sd_setImage(with: URL(string: viewModel.imageURL), placeholderImage: #imageLiteral(resourceName: "ic-youtube"))
        kindLabel.text = viewModel.kindLabel
    }
}
