//
//  ChannelCell.swift
//  FinalProject
//
//  Created by MBA0158 on 9/17/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class ChannelCell: TableCell {

    // MARK: - Outlet
    @IBOutlet private weak var channelImage: ImageView!
    @IBOutlet private weak var channelNameLabel: Label!
    @IBOutlet private weak var channelDescriptionLabel: Label!

    var viewModel: ChannelCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        channelImage.sd_setImage(with: URL(string: viewModel.channelImageURL), placeholderImage: #imageLiteral(resourceName: "ic-search"))
        channelNameLabel.text = viewModel.channelName
        channelDescriptionLabel.text = viewModel.channelDescription
    }
}
