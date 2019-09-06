//
//  SearchResult.swift
//  FinalProject
//
//  Created by PCI0008 on 9/4/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

@objcMembers final class SearchResult: Mappable {

    @objc dynamic var kind = ""
    @objc dynamic var nextPageToken = ""
    @objc dynamic var prevPageToken = ""
    @objc dynamic var items: [YouTube] = []

    init() { }

    init?(map: Map) {}

    func mapping(map: Map) {
        kind <- map["kind"]
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
        items <- map["items"]
    }
}
