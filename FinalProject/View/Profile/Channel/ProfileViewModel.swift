//
//  ProfileViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 9/5/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class ProfileViewModel {

    private var video: YouTube

    var id: String {
        return video.id
    }
    var videoName: String {
        return video.titleVideo
    }
    var channelName: String {
        return video.channelTitle
    }
    var dateUpdate: String {
        return video.publishedAt
    }
    var channelURL: String {
        return video.thumbnailURL
    }

    var isFavorite: Bool {
        return video.isFavorite
    }

    init(video: YouTube = YouTube()) {
        self.video = video
    }

    func getChannelCellModel(at indexPath: IndexPath) -> ProfileCellViewModel {
        return ProfileCellViewModel(imageChannelURL: channelURL, channelName: channelName, date: dateUpdate, views: "99999", like: "11111", dislike: "123")
    }

    func changeStateFavorite() {
        if isFavorite {
//            addFavorite(video: video)
        } else {
//            deleteFavorite(video: video)
        }
    }

    func addFavorite(video: YouTube) {
        DispatchQueue.main.async {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(video)
                }
            } catch {
                print("KError with Realm")
            }
        }
    }

    func deleteFavorite(video: YouTube) {
        DispatchQueue.main.async {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete(video)
                }
            } catch {
                print("Delete Error")
            }
        }
    }
}
