//
//  KindCollectionCell.swift
//  FinalProject
//
//  Created by MBA0158 on 9/17/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class KindCollectionCell: CollectionCell {

    // MARK: - Outlet
    @IBOutlet private weak var kindImage: ImageView!
    @IBOutlet private weak var kindLabel: Label!

    var viewModel: KindCollectionCellViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        kindImage.sd_setImage(with: URL(string: viewModel.kindImageURL), placeholderImage: #imageLiteral(resourceName: "ic-search"))
        kindLabel.text = viewModel.kindName
    }
}
