//
//  UserCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var userImage: ImageView!
    @IBOutlet weak var userNameLabel: Label!
    @IBOutlet weak var dateCommentLabel: Label!
    @IBOutlet weak var commentLabel: Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
