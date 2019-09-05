//
//  ProfileChannelCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class ProfileChannelCell: TableCell {

    @IBOutlet private weak var imageChannel: ImageView!
    @IBOutlet private weak var channelLabel: Label!
    @IBOutlet private weak var dateLabel: Label!
    @IBOutlet private weak var viewsLabel: Label!
    @IBOutlet private weak var likeLabel: Label!
    @IBOutlet private weak var dislikeLabel: Label!

    var viewModel: ProfileCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        imageChannel.sd_setImage(with: URL(string: viewModel.imageChannelURL), placeholderImage: #imageLiteral(resourceName: "ic-youtube"))
        channelLabel.text = viewModel.channelName
        dateLabel.text = viewModel.date
        viewsLabel.text = viewModel.views
        likeLabel.text = viewModel.like
        dislikeLabel.text = viewModel.dislike
    }
}
