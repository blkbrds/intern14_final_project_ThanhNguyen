//
//  InformationCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/4/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class InformationCellViewModel: MVVM.ViewModel {
    var videoName: String = ""
    var kindName: String = ""
    var creatorName: String = ""
    var trendName: String = ""

    init(videoNameLabel: String, kindNameLabel: String, creatorNameLabel: String, trendNameLabel: String) {
        self.videoName = videoNameLabel
        self.kindName = kindNameLabel
        self.creatorName = creatorNameLabel
        self.trendName = trendNameLabel
    }
}
