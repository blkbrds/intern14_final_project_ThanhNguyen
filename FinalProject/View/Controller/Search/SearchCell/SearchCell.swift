//
//  SearchCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class SearchCell: TableCell {
    // MARK: - Outlets
    @IBOutlet private weak var videoImage: ImageView!
    @IBOutlet private weak var videoNameLabel: Label!
    @IBOutlet private weak var channelNameLabel: Label!
    @IBOutlet private weak var viewsLabel: Label!

    var viewModel: SearchCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        videoImage.sd_setImage(with: URL(string: viewModel.videoImage), placeholderImage: #imageLiteral(resourceName: "ic-youtube"))
        videoNameLabel.text = viewModel.videoName
        channelNameLabel.text = viewModel.channelName
        viewsLabel.text = viewModel.views
    }
}
