//
//  HeaderCollectionCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

class HeaderCollectionCell: UICollectionViewCell {
    @IBOutlet weak var headerImage: ImageView!
    @IBOutlet weak var headerNameLabel: Label!

    var image: UIImage?
    var label: UILabel?

    var viewModel = HeaderCollectionViewModel() {
        didSet {
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateView() {
        headerImage.image = viewModel.image
        headerNameLabel.text = viewModel.label
    }
}
