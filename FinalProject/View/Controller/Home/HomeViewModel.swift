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
    var channelResult: SearchResult = SearchResult()
    var token = ""

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

    // MARK: - GetData for Channel
    func getData(completion: @escaping APICompletion) {
        Api.Channel.getSearchResult(pageToken: token, maxResults: 20, keyword: "karaoke") { result in
            switch result {
            case .success(let channelResult):
                self.token = channelResult.nextPageToken
                for video in channelResult.items {
                    self.channelResult.items.append(video)
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

    func heightForRowAt(at indexPath: IndexPath) -> CGFloat {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return 0 }
        switch sectionType {
        case .trending:
            return 200
        case .channel:
            return 100
        default:
            return 80
        }
    }

    func heightForHeaderInSection(at section: Int) -> CGFloat {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending:
            return 0
        default:
            return 20
        }
    }
}
