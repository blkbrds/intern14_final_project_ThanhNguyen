//
//  SectionTableView.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class SectionTableView: UITableViewHeaderFooterView {
// MARK: - Outlet
    @IBOutlet private weak var sectionNameLabel: Label!

    func updateUI(sectionName: String) {
        self.sectionNameLabel.text = sectionName
    }
}
