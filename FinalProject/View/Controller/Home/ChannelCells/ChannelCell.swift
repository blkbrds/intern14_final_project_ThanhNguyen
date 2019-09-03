//
//  ChannelCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class ChannelCell: UITableViewCell {

    @IBOutlet private weak var channelImage: ImageView!
    @IBOutlet private weak var channelLabel: Label!
    @IBOutlet private weak var channelDescriptionLabel: Label!

    var viewModel: ChannelCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        channelImage.image = viewModel.image
        channelLabel.text = viewModel.channelName
        channelDescriptionLabel.text = viewModel.channelDescriptionText
    }
}
