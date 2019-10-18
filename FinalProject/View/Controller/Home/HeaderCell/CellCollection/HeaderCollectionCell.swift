//
//  HeaderCollectionCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class HeaderCollectionCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var headerImage: ImageView!
    @IBOutlet private weak var headerNameLabel: Label!

    var viewModel: HeaderCollectionViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        headerImage.sd_setImage(with: URL(string: viewModel.imageURL), placeholderImage: #imageLiteral(resourceName: "ic-youtube"))
        headerNameLabel.text = viewModel.headerName
    }
}
