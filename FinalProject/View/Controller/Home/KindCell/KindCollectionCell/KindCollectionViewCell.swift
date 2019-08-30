//
//  KindCollectionViewCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

class KindCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var kindImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 5
        clipsToBounds = true
        kindImage.clipsToBounds = true
    }

    func undateCell(image: UIImage) {
        kindImage.image = image
    }
}
