//
//  HeaderCellViewModel.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class HeaderCellViewModel: MVVM.ViewModel {

    // MARK: - Propeties
    var youtubeResult: YouTubeResult = YouTubeResult()

    init(youtubeResult: YouTubeResult = YouTubeResult()) {
        self.youtubeResult = youtubeResult
    }

    func numberOfItemsInSection() -> Int {
        return youtubeResult.items.count
    }

    func getTrendingCellModel(at indexPath: IndexPath) -> HeaderCollectionCellViewModel {
        return HeaderCollectionCellViewModel(imageURL: youtubeResult.items[indexPath.row].thumbnailURL, headerName: youtubeResult.items[indexPath.row].titleVideo)
    }
}
