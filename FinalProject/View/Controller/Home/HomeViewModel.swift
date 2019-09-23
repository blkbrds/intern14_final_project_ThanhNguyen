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
    var channelResult: YouTubeResult = YouTubeResult()
    var boleroResult: YouTubeResult = YouTubeResult()
    var xuanResult: YouTubeResult = YouTubeResult()
    var vangResult: YouTubeResult = YouTubeResult()

    var tokenChannel = ""
    var tokenBolero = ""
    var tokenNhacXuan = ""
    var tokenNhacVang = ""
    var tokenTrending = ""

    func writeRealm(objects: [Object]) {
        let realm = try Realm()
        try! realm.write {
            realm.deleteAll()
            objects.forEach({ (object) in
                realm.add(object)
            })
        }
    }

    func fetchData(completion: @escaping (Bool) -> ()) {
        do {
            let realm = try! Realm()
            let musics = realm.objects(YouTube.self)
            print("REALM: Musics total = \(musics.count)")
            self.myMusic.append(contentsOf: musics)
            
            completion(true)
        }
    }

    // MARK: - Section Type
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
//                RealmManager.shared.add(object: self.trendingResult)
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - GetData for Channel
    func getDataChannel(isLoadMore: Bool, completion: @escaping APICompletion) {
        Api.YouTube.getYouTubeResult(pageToken: tokenChannel, maxResults: 20, keyword: "michaeljackson") { result in
            switch result {
            case .success(let channelResult):
                self.tokenChannel = channelResult.nextPageToken
                if !isLoadMore {
                    self.channelResult.items.removeAll()
                }
                for video in channelResult.items {
                    self.channelResult.items.append(video)
                }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - GetData for Bolero
    func getDataBolero(completion: @escaping APICompletion) {
        Api.YouTube.getYouTubeResult(pageToken: tokenBolero, maxResults: 10, keyword: "bolero") { result in
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

    // MARK: - GetData for NhacXuan
    func getDataNhacXuan(completion: @escaping APICompletion) {
        Api.YouTube.getYouTubeResult(pageToken: tokenNhacXuan, maxResults: 10, keyword: "nhacxuan") { result in
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

    // MARK: - GetData for NhacVang
    func getDataNhacVang(completion: @escaping APICompletion) {
        Api.YouTube.getYouTubeResult(pageToken: tokenNhacVang, maxResults: 10, keyword: "nhacvang") { result in
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
                                    channelDescription: channelResult.items[indexPath.row].descriptionVideo)
    }

    func getTrendingCellModel() -> HeaderCellViewModel {
        return HeaderCellViewModel(youtubeResult: trendingResult)
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
