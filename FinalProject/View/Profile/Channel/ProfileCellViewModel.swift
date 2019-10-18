//
//  ProfileCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/5/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class ProfileCellViewModel: MVVM.ViewModel {
    var imageChannelURL: String = ""
    var channelName: String = ""
    var date: String = ""
    var views: String = ""
    var like: String = ""
    var dislike: String = ""

    init(imageChannelURL: String, channelName: String, date: String, views: String, like: String, dislike: String) {
        self.imageChannelURL = imageChannelURL
        self.channelName = channelName
        self.date = date
        self.views = views
        self.like = like
        self.dislike = dislike
    }
}
