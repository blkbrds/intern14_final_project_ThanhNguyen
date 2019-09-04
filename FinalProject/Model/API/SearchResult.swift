//
//  SearchResult.swift
//  FinalProject
//
//  Created by PCI0008 on 9/4/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

final class SearchResult: Mappable {

    var nextPageToken = ""
    var prevPageToken = ""
    var items: [YouTube] = []

    init() { }

    init?(map: Map) {}

    func mapping(map: Map) {
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
        items <- map["items"]
    }
}
