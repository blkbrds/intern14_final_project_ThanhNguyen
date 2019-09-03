//
//  KindCollectionCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class KindCollectionCellViewModel {
    var image: UIImage?
    var kindLabel: String?

    init() {}

    init(image: UIImage, kindLabel: String) {
        self.image = image
        self.kindLabel = kindLabel
    }
}
