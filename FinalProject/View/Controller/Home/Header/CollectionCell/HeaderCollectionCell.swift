//
//  HeaderCollectionCell.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class HeaderCollectionCell: CollectionCell {

    // MARK: - Outlet
    @IBOutlet private weak var headerLabel: Label!
    @IBOutlet private weak var headerImage: ImageView!

    var viewModel: HeaderCollectionCellViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateView() {
        guard let viewModel = viewModel else { return }
        headerLabel.text = viewModel.headerName
        headerImage.sd_setImage(with: URL(string: viewModel.imageURL), placeholderImage: #imageLiteral(resourceName: "ic-search-selected"))
    }
}
