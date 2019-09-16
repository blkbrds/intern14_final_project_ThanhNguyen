//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils
import YoutubePlayer_in_WKWebView

final class ProfileViewController: ViewController {
    // MARK: - Outlets
    @IBOutlet private weak var playerView: WKYTPlayerView!
    @IBOutlet private weak var tableView: UITableView!

    let button = UIButton()

    var isChangeImage = true {
        didSet {
            if isChangeImage {
                self.button.setImage(#imageLiteral(resourceName: "ic-jupiter"), for: .normal)
            } else {
                self.button.setImage(#imageLiteral(resourceName: "ic-earth"), for: .normal)
            }
        }
    }


    var viewModel = ProfileViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        button.setImage(#imageLiteral(resourceName: "ic-star"), for: .normal)
        button.addTarget(self, action: #selector(favoritesButtonDidClick), for: .touchUpInside)
        let rightButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightButton

        tableView.register(ProfileChannelCell.self)

        playerView.load(withVideoId: viewModel.id)
    }

    @objc private func favoritesButtonDidClick() {
//        viewModel.changeStateFavorite()
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ProfileChannelCell.self)
        cell.viewModel = viewModel.getChannelCellModel(at: indexPath)
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {

}
