//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import SwiftUtils
import MVVM

final class HomeViewModel: MVVM.ViewModel {

    // MARK: - Propeties
    // Dùng chung 1 API với Search
    var trendingResult: SearchResult = SearchResult()
    var channelResult: SearchResult = SearchResult()
    var boleroResult: SearchResult = SearchResult()
    var xuanResult: SearchResult = SearchResult()
    var vangResult: SearchResult = SearchResult()

    var tokenChannel = ""
    var tokenBolero = ""
    var tokenNhacXuan = ""
    var tokenNhacVang = ""
    var tokenTrending = ""

    enum SectionType: Int, CaseIterable {
        case trending
        case bolero
        case nhacXuan
        case nhacVang
        case channel

        var title: String {
            switch self {
            case .trending:
                return ""
            case .bolero:
                return "Bolero"
            case .nhacXuan:
                 return "Nhac xuan"
            case .nhacVang:
                return "Nhac vang"
            case .channel:
                return "Channel"
            }
        }
    }

    // MARK: - Public func

    func getDataTrending(completion: @escaping APICompletion) {
        Api.Search.getSearchResult(pageToken: tokenTrending, maxResults: 5, keyword: "trending") { result in
            switch result {
            case .success(let trendingResult):
                self.tokenTrending = trendingResult.nextPageToken
                for video in trendingResult.items {
                    self.trendingResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - GetData for Channel
    func getDataChannel(completion: @escaping APICompletion) {
        Api.Channel.getSearchResult(pageToken: tokenChannel, maxResults: 20, keyword: "karaoke") { result in
            switch result {
            case .success(let channelResult):
                self.tokenChannel = channelResult.nextPageToken
                for video in channelResult.items {
                    self.channelResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getDataBolero(completion: @escaping APICompletion) {
        Api.Channel.getSearchResult(pageToken: tokenBolero, maxResults: 10, keyword: "bolero") { result in
            switch result {
            case .success(let boleroResult):
                self.tokenBolero = boleroResult.nextPageToken
                for video in boleroResult.items {
                    self.boleroResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getDataNhacXuan(completion: @escaping APICompletion) {
        Api.Channel.getSearchResult(pageToken: tokenNhacXuan, maxResults: 10, keyword: "nhacxuan") { result in
            switch result {
            case .success(let xuanResult):
                self.tokenNhacXuan = xuanResult.nextPageToken
                for video in xuanResult.items {
                    self.xuanResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getDataNhacVang(completion: @escaping APICompletion) {
        Api.Channel.getSearchResult(pageToken: tokenNhacVang, maxResults: 10, keyword: "nhacvang") { result in
            switch result {
            case .success(let vangResult):
                self.tokenNhacVang = vangResult.nextPageToken
                for video in vangResult.items {
                    self.vangResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func numberOfSections() -> Int {
        return SectionType.allCases.count
    }

    func numberOfRowInSection(in section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending, .bolero, .nhacVang, .nhacXuan:
            return 1
        default:
            return channelResult.items.count
        }
    }

    func getChannelCellModel(at indexPath: IndexPath) -> ChannelCellViewModel {
        return ChannelCellViewModel(channelImageURL: channelResult.items[indexPath.row].thumbnailURL,
                                    channelName: channelResult.items[indexPath.row].channelTitle,
                                    channelDescriptionText: channelResult.items[indexPath.row].description)
    }

    func getTrendingCellModel() -> HeaderCellViewModel {
        return HeaderCellViewModel(headerResult: trendingResult)
    }

    func getBoleroCellModel() -> KindCellViewModel {
        return KindCellViewModel(kindType: .bolero, bolero: boleroResult)
    }

    func getNhacXuanCellModel() -> KindCellViewModel {
        return KindCellViewModel(kindType: .nhacXuan, xuan: xuanResult)
    }

    func getNhacVangCellModel() -> KindCellViewModel {
        return KindCellViewModel(kindType: .nhacVang, vang: vangResult)
    }
}
