//
//  YouTubeResult.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

@objcMembers final class YouTubeResult: Mappable {
    // MARK: - Propeties
    dynamic var kind = ""
    dynamic var nextPageToken = ""
    dynamic var prevPageToken = ""
    dynamic var items: [YouTube] = []

    init() { }

    init?(map: Map) { }

    func mapping(map: Map) {
        kind <- map["kind"]
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
        items <- map["items"]
    }
}
