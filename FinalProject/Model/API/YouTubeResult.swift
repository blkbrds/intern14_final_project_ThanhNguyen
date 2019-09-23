//
//  YouTubeResult.swift
//  FinalProject
//
//  Created by ThANHBEDE on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers final class YouTubeResult: Object, Mappable {

    // MARK: - Propeties
    dynamic var kind = ""
    dynamic var nextPageToken = ""
    dynamic var prevPageToken = ""
    dynamic var items: [YouTube] = []
    dynamic var videoName = ""

    override static func primaryKey() -> String? {
        return "videoName"
    }

    required convenience init?(map: Map) {
        self.init()
    }

//    convenience required init() {
//        self.init()
//    }
//
//    convenience init?(map: Map) {
//        self.init()
//    }
//
//    required init(value: Any, schema: RLMSchema) {
//        fatalError("init(value:schema:) has not been implemented")
//    }
//
//    required init(realm: RLMRealm, schema: RLMObjectSchema) {
//        fatalError("init(realm:schema:) has not been implemented")
//    }

    convenience init(json: JSObjet) {
        var schema: [String: Any] = [:]
        if let kind = json["kind"] {
            schema["kind"] = kind
        }
        if let nextPageToken = json["nextPageToken"] {
            schema["nextPageToken"] = nextPageToken
        }
        if let prevPageToken = json["prevPageToken"] {
            schema["prevPageToken"] = prevPageToken
        }
        if let items = json["items"] {
            schema["items"] = items
        }

        self.init(value: schema)
    }

    func mapping(map: Map) {
        kind <- map["kind"]
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
        items <- map["items"]
    }
}
