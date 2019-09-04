//
//  InformationCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/4/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class InformationCellViewModel {
    var videoNameLabel: String?
    var kindNameLabel: String?
    var creatorNameLabel: String?
    var trendNameLabel: String?

    init() {}

    init(videoNameLabel: String, kindNameLabel: String, creatorNameLabel: String, trendNameLabel: String) {
        self.videoNameLabel = videoNameLabel
        self.kindNameLabel = kindNameLabel
        self.creatorNameLabel = creatorNameLabel
        self.trendNameLabel = trendNameLabel
    }
}
