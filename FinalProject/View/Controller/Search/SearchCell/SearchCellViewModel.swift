//
//  SearchCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class SearchCellViewModel {
    var videoImage: UIImage?
    var videoName: String = ""
    var channelName: String = ""
    var views: String = ""

    init() {}

    init(videoImage: UIImage, videoName: String, channelName: String, views: String) {
        self.videoImage = videoImage
        self.videoName = videoName
        self.channelName = channelName
        self.views = views
    }
}
