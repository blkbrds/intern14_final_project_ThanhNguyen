//
//  ChannelCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

final class ChannelCellViewModel {

    var channelImageURL: String = ""
    var channelName: String = ""
    var channelDescriptionText: String = ""

    init(channelImageURL: String, channelName: String, channelDescriptionText: String) {
        self.channelImageURL = channelImageURL
        self.channelName = channelName
        self.channelDescriptionText = channelDescriptionText
    }
}
