//
//  YouTube.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers final class YouTube: Object, Mappable {

    dynamic var id = ""
    dynamic var titleVideo = ""
    dynamic var thumbnailURL = ""
    dynamic var publishedAt = ""
    dynamic var channelTitle = ""
    dynamic var descriptionVideo = ""
    dynamic var isFavorite = false

    required convenience init?(map: Map) {
        self.init()
    }

    convenience init(json: JSObject) {
        var schema: [String: Any] = [:]
        if let id = json["id"] as? JSObject {
            if let videoId = id["videoId"] {
                schema["videoId"] = videoId
            }
        }
        if let snippet = json["snippet"] as? JSObject {
            if let title = snippet["title"] {
                schema["title"] = title
            }
            if let publishedAt = snippet["publishedAt"] {
                schema["publishedAt"] = publishedAt
            }
            if let channelTitle = snippet["channelTitle"] {
                schema["channelTitle"] = channelTitle
            }
            if let description = snippet["description"] {
                schema["description"] = description
            }
            if let thumbnails = snippet["thumbnails"] as? JSObject {
                if let high = thumbnails["high"] as? JSObject {
                    if let url = high["url"] {
                        schema["url"] = url
                    }
                }
            }
        }

        self.init(value: schema)
    }

    func mapping(map: Map) {
        id <- map["id.videoId"]
        titleVideo <- map["snippet.title"]
        thumbnailURL <- map["snippet.thumbnails.high.url"]
        publishedAt <- map["snippet.publishedAt"]
        channelTitle <- map["snippet.channelTitle"]
        descriptionVideo <- map["snippet.description"]
    }
}
