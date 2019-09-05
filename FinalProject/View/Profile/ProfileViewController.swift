//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

final class ProfileViewController: ViewController {
    // MARK: - Outlets
    @IBOutlet private weak var playerView: WKYTPlayerView!
    @IBOutlet private weak var tableView: UITableView!

    var viewModel = ProfileViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: viewModel.id)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ProfileViewController: UITableViewDelegate {

}
