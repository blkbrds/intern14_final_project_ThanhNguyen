//
//  HeaderCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit
import SwiftUtils

final class HeaderCellViewModel {
    // MARK: - Propeties
    var headerResult: SearchResult = SearchResult()
    var token = ""

    // MARK: - Public func

    func getData(completion: @escaping APICompletion) {
        Api.Search.getSearchResult(pageToken: token, maxResults: 5, keyword: "trending") { result in
            switch result {
            case .success(let headerResult):
                self.token = headerResult.nextPageToken
                for video in headerResult.items {
                    self.headerResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func numberOfItemsInSection() -> Int {
        return headerResult.items.count
    }

    func getHeaderCellModel(at indexPath: IndexPath) -> HeaderCollectionViewModel {
        return HeaderCollectionViewModel(imageURL: headerResult.items[indexPath.row].thumbnailURL, headerName: headerResult.items[indexPath.row].titleVideo)
    }

    func collectionViewLayout() -> CGSize {
        return CGSize(width: kScreenSize.width, height: 200)
    }

    func collectionViewLayout() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionViewLayout() -> CGFloat {
        return 0.0
    }
}
