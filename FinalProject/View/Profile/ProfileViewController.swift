//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ProfileViewController: ViewController {
    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerView.load(withVideoId: "DNrNBLI3d68")
    }
}
