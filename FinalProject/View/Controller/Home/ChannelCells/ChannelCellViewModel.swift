//
//  ChannelCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class ChannelCellViewModel {

    var image: UIImage = #imageLiteral(resourceName: "ic-youtube")
    var channelName: String = ""
    var channelDescriptionText: String = ""

    init(image: UIImage, channelName: String, channelDescriptionText: String) {
        self.image = image
        self.channelName = channelName
        self.channelDescriptionText = channelDescriptionText
    }
}
