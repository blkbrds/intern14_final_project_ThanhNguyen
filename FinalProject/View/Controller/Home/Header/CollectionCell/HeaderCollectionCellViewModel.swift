//
//  HeaderCollectionCellViewModel.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class HeaderCollectionCellViewModel: MVVM.ViewModel {

    // MARK: - Propeties
    var imageURL: String = ""
    var headerName: String = ""

    init(imageURL: String, headerName: String) {
        self.imageURL = imageURL
        self.headerName = headerName
    }
}
