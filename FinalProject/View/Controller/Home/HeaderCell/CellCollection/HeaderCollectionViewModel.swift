//
//  HeaderCollectionViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HeaderCollectionViewModel {
    var image: UIImage?
    var headerName: String?

    init() {}

    init(image: UIImage, headerName: String) {
        self.image = image
        self.headerName = headerName
    }
}
