//
//  InformationCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class InformationCell: UITableViewCell {
    @IBOutlet private weak var videoNameLabel: Label!
    @IBOutlet private weak var kindNameLabel: Label!
    @IBOutlet private weak var creatorNameLabel: Label!
    @IBOutlet private weak var trendNameLabel: Label!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
