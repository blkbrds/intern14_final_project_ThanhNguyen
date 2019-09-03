//
//  HeaderCollectionCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class HeaderCollectionCell: UICollectionViewCell {
    //MARK: - Outlets
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
        headerImage.image = viewModel.image
        headerNameLabel.text = viewModel.headerName
    }
}
