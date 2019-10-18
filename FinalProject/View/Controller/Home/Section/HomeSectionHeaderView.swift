//
//  KindSession.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class HomeSectionHeaderView: UITableViewHeaderFooterView {
    // MARK: - Outlets
    @IBOutlet private weak var sectionNameLabel: Label!

    func updateUI(sectionName: String) {
        self.sectionNameLabel.text = sectionName
    }

    @IBAction private func moreButtonTouchUpInside(_ sender: Button) {
    }
}
