//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import MVVM
import RealmSwift

final class HomeViewModel: MVVM.ViewModel {
    // MARK: - Propeties
    var trendingResult: YouTubeResult = YouTubeResult()

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
        Api.YouTube.getYouTubeResult(pageToken: tokenTrending, maxResults: 5, keyword: "trending") { result in
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

    func numberOfSections() -> Int {
        return SectionType.allCases.count
    }

    func numberOfRowInSection(in section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending, .bolero, .nhacVang, .nhacXuan:
            return 1
        default:
            return 10
        }
    }

    func getTrendingCellModel() -> HeaderCellViewModel {
        return HeaderCellViewModel(youtubeResult: trendingResult)
    }
}
