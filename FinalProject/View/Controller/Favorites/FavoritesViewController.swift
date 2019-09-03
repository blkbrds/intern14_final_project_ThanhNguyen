//
//  FavoritesViewController.swift
//  FinalProject
//
//  Created by PCI0008 on 8/29/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

final class FavoritesViewController: ViewController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FAVORITES"
        configTrashButton()
    }

    private func configTrashButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(#imageLiteral(resourceName: "ic-trash"), for: .normal)
        button.addTarget(self, action: #selector(trashButtonDidClick), for: .touchUpInside)
        let rightButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightButton
    }

    #warning("Chua lam xong button trash")
    @objc private func trashButtonDidClick() {

    }
}
