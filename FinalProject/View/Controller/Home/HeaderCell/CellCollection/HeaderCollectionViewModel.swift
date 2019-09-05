//
//  HeaderCollectionViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

final class HeaderCollectionViewModel {
    var imageURL: String = ""
    var headerName: String = ""

    init(imageURL: String, headerName: String) {
        self.imageURL = imageURL
        self.headerName = headerName
    }
}
