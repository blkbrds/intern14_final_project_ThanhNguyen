//
//  HeaderCellViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import SwiftUtils
import MVVM

final class HeaderCellViewModel: MVVM.ViewModel {
    // MARK: - Propeties
    var headerResult: SearchResult = SearchResult()

    init(headerResult: SearchResult = SearchResult()) {
        self.headerResult = headerResult
    }

    // MARK: - Public func

    func numberOfItemsInSection() -> Int {
        return headerResult.items.count
    }

    func getTrendingCellModel(at indexPath: IndexPath) -> HeaderCollectionViewModel {
        return HeaderCollectionViewModel(imageURL: headerResult.items[indexPath.row].thumbnailURL, headerName: headerResult.items[indexPath.row].titleVideo)
    }
}
