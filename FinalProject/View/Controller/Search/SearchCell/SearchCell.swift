//
//  SearchCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoNameLabel: UILabel!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!

    var viewModel: SearchCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        videoImage.image = viewModel.videoImage
        videoNameLabel.text = viewModel.videoName
        channelNameLabel.text = viewModel.channelName
        viewsLabel.text = viewModel.views
    }
}
