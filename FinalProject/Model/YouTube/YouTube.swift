//
//  YouTube.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation
import ObjectMapper

@objcMembers final class YouTube: Mappable {

    @objc dynamic var id = ""
    @objc dynamic var titleVideo = ""
    @objc dynamic var thumbnailURL = ""
    @objc dynamic var publishedAt = ""
    @objc dynamic var channelTitle = ""

    init() { }

    init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id.videoId"]
        titleVideo <- map["snippet.title"]
        thumbnailURL <- map["snippet.thumbnails.high.url"]
        publishedAt <- map["snippet.publishedAt"]
        channelTitle <- map["snippet.channelTitle"]
    }
}
