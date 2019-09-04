//
//  UserCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class UserCell: UITableViewCell {
    @IBOutlet private weak var userImage: ImageView!
    @IBOutlet private weak var userNameLabel: Label!
    @IBOutlet private weak var dateCommentLabel: Label!
    @IBOutlet private weak var commentLabel: Label!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
