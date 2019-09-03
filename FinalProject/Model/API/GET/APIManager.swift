//
//  APIManager.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

struct APIManager {
    struct Path {
        static let key = "AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF"
        static let baseURL = "https://www.googleapis.com/youtube/v3/search?"
        static let abc = "https://www.googleapis.com/youtube/v3/search?pageToken=CDIQAA&part=snippet&maxResults=25&order=relevance&q=lactroi&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
    }

    struct YouTube {}

    struct Downloader {}
}
