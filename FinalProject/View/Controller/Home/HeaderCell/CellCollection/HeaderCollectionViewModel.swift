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
    var image = UIImage()
    var label = String()

    init() {}

    init(image: UIImage, label: String) {
        self.image = image
        self.label = label
    }
}
