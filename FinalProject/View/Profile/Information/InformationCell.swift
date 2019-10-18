//
//  InformationCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class InformationCell: TableCell {
    @IBOutlet private weak var videoNameLabel: Label!
    @IBOutlet private weak var kindNameLabel: Label!
    @IBOutlet private weak var creatorNameLabel: Label!
    @IBOutlet private weak var trendNameLabel: Label!

    var viewModel: InformationCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        videoNameLabel.text = viewModel.videoName
        kindNameLabel.text = viewModel.kindName
        creatorNameLabel.text = viewModel.creatorName
        trendNameLabel.text = viewModel.trendName
    }
}
