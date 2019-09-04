//
//  SearchViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import SwiftUtils

final class SearchViewModel {
    var videos = [YouTube]()
    var token = ""

    func setupData() {
        APIManager.YouTube.getBot(pageToken: token, maxResults: 10, keyword: "") { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let dummy):
                self.token = dummy.token
                for video in dummy.video {
                    self.videos.append(video)
                }
            }
        }
    }

    func getSearchCellModel(at indexPath: IndexPath) -> SearchCellViewModel {
        let video = videos[indexPath.row]
        let search = SearchCellViewModel()
        search.videoName = video.titleVideo
        search.channelName = video.channelTitle
        search.views = video.publishedAt

        if let thumbnail = video.thumbnail {
            search.videoImage = thumbnail
        } else {
            search.videoImage = nil
            APIManager.Downloader.downloadImage(imageURL: video.imageStr, index: indexPath.row) { (image, index) in
                var video = self.videos[index]
                video.thumbnail = image
            }
        }
        return search
    }

    func heightForRowAt() -> CGFloat {
        return 110
    }
}
