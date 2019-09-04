//
//  ProfileChannelCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

class ProfileChannelCell: UITableViewCell {

    @IBOutlet weak var imageChannel: ImageView!
    @IBOutlet weak var channelLabel: Label!
    @IBOutlet weak var dateLabel: Label!
    @IBOutlet weak var viewLabel: Label!
    @IBOutlet weak var likeLabel: Label!
    @IBOutlet weak var dislikeLabel: Label!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
