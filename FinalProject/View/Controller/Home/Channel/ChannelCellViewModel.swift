//
//  ChannelCellViewModel.swift
//  FinalProject
//
//  Created by MBA0158 on 9/17/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class ChannelCellViewModel: MVVM.ViewModel {

    var channelImageURL: String = ""
    var channelName: String = ""
    var channelDescription: String = ""

    init(channelImageURL: String, channelName: String, channelDescription: String) {
        self.channelImageURL = channelImageURL
        self.channelName = channelName
        self.channelDescription = channelDescription
    }
}
