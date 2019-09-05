//
//  UserCell.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class UserCell: TableCell {
    // MARK: - Outlets
    @IBOutlet private weak var userImage: ImageView!
    @IBOutlet private weak var userNameLabel: Label!
    @IBOutlet private weak var dateCommentLabel: Label!
    @IBOutlet private weak var commentLabel: Label!

    var viewModel: UserCellViewModel? {
        didSet {
            updateView()
        }
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        userImage.sd_setImage(with: URL(string: viewModel.userImageURL), placeholderImage: #imageLiteral(resourceName: "ic-youtube"))
        userNameLabel.text = viewModel.userName
        dateCommentLabel.text = viewModel.dateComment
        commentLabel.text = viewModel.commentLabel
    }
}
