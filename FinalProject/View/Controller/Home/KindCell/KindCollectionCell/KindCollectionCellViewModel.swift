//
//  KindCollectionCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class KindCollectionCellViewModel: MVVM.ViewModel {
    var imageURL: String = ""
    var kindLabel: String = ""

    init(imageURL: String, kindLabel: String) {
        self.imageURL = imageURL
        self.kindLabel = kindLabel
    }
}
