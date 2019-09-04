//
//  UserCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/4/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class UserCellViewModel {
    var userImage: UIImage = #imageLiteral(resourceName: "ic-youtube")
    var userNameLabel: String = ""
    var dateCommentLabel: String = ""
    var commentLabel: String = ""

    init(userImage: UIImage, userNameLabel: String, dateCommentLabel: String, commentLabel: String) {
        self.userImage = userImage
        self.userNameLabel = userNameLabel
        self.dateCommentLabel = dateCommentLabel
        self.commentLabel = commentLabel
    }
}
