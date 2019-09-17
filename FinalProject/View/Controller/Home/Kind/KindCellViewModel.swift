//
//  KindCellViewModel.swift
//  FinalProject
//
//  Created by MBA0158 on 9/17/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM

final class KindCellViewModel: MVVM.ViewModel {

    enum KindType: Int, CaseIterable {
        case bolero
        case nhacXuan
        case nhacVang
    }

    // MARK: - Propeties
    var boleroResult: YouTubeResult
    var xuanResult: YouTubeResult
    var vangResult: YouTubeResult
    var kindType: KindType = .bolero

    init(kindType: KindType = .bolero, bolero: YouTubeResult = YouTubeResult(), xuan: YouTubeResult = YouTubeResult(), vang: YouTubeResult = YouTubeResult()) {
        self.kindType = kindType
        self.boleroResult = bolero
        self.xuanResult = xuan
        self.vangResult = vang
    }

    // MARK: - Public func
    func getBoleroCellModel(at indexPath: IndexPath) -> KindCollectionCellViewModel {
        return KindCollectionCellViewModel(kindImageURL: boleroResult.items[indexPath.row].thumbnailURL,
                                           kindLabel: boleroResult.items[indexPath.row].titleVideo)
    }

    func getNhacXuanCellModel(at indexPath: IndexPath) -> KindCollectionCellViewModel {
        return KindCollectionCellViewModel(kindImageURL: xuanResult.items[indexPath.row].thumbnailURL,
                                           kindLabel: xuanResult.items[indexPath.row].titleVideo)
    }

    func getNhacVangCellModel(at indexPath: IndexPath) -> KindCollectionCellViewModel {
        return KindCollectionCellViewModel(kindImageURL: vangResult.items[indexPath.row].thumbnailURL,
                                           kindLabel: vangResult.items[indexPath.row].titleVideo)
    }

    func numberOfItems() -> Int {
        switch kindType {
        case .bolero:
            return boleroResult.items.count
        case .nhacXuan:
            return xuanResult.items.count
        case .nhacVang:
            return vangResult.items.count
        }
    }
}
