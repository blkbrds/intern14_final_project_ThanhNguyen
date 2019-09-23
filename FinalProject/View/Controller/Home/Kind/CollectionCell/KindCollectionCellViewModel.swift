//
//  KindCollectionCellViewModel.swift
//  FinalProject
//
//  Created by MBA0158 on 9/17/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class KindCollectionCellViewModel: MVVM.ViewModel {
    var kindImageURL: String = ""
    var kindName: String = ""

    init(kindImageURL: String, kindLabel: String) {
        self.kindImageURL = kindImageURL
        self.kindName = kindLabel
    }
}
