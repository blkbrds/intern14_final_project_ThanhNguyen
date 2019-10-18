//
//  UserCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/4/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class UserCellViewModel: MVVM.ViewModel {

    var userImageURL: String = ""
    var userName: String = ""
    var dateComment: String = ""
    var commentLabel: String = ""

    init(userImageURL: String, userNameLabel: String, dateCommentLabel: String, commentLabel: String) {
        self.userImageURL = userImageURL
        self.userName = userNameLabel
        self.dateComment = dateCommentLabel
        self.commentLabel = commentLabel
    }
}
