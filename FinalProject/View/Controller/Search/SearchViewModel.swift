//
//  SearchViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import SwiftUtils
import MVVM

final class SearchViewModel: MVVM.ViewModel {
    var searchResult: SearchResult = SearchResult()
    var token = ""
    var searchText = ""

    func getData(completion: @escaping APICompletion) {
        Api.Search.getSearchResult(pageToken: token, maxResults: 10, keyword: searchText) { result in
            switch result {
            case .success(let searchResult):
                self.token = searchResult.nextPageToken
                for video in searchResult.items {
                    self.searchResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getSearchCellModel(at indexPath: IndexPath) -> SearchCellViewModel {
        return SearchCellViewModel(videoImage: searchResult.items[indexPath.row].thumbnailURL,
                                   videoName: searchResult.items[indexPath.row].titleVideo,
                                   channelName: searchResult.items[indexPath.row].channelTitle,
                                   views: searchResult.items[indexPath.row].publishedAt)
    }
}
