//
//  KindCollectionViewCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class KindCollectionCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var kindImage: ImageView!
    @IBOutlet weak var kindLabel: Label!

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
        kindImage.image = viewModel.image
        kindLabel.text = viewModel.kindLabel
    }
}
