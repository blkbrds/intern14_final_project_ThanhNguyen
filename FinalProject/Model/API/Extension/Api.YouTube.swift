//
//  Api.YouTube.swift
//  FinalProject
//
//  Created by MBA0158 on 9/16/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

extension Api.YouTube {

    struct QueryString {
        var pageToken: String
        var maxResults: Int
        var keyword: String

        func toURL() -> String {
            let key = "AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
            return Api.Path.Search.url + "?pageToken=\(pageToken)&part=snippet&" + "maxResults=\(maxResults)&order=relevance&" + "q=\(keyword)&" + "key=\(key)"
        }
    }

    static func getYouTubeResult(pageToken: String, maxResults: Int, keyword: String, completion: @escaping Completion<YouTubeResult>) {
        let urlString = QueryString(pageToken: pageToken, maxResults: maxResults, keyword: keyword).toURL()

        api.request(method: .get, urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    guard let value = value as? JSObject,
                        let searchResult = Mapper<YouTubeResult>().map(JSON: value) else {
                        completion(.failure(Api.Error.json))
                        return
                    }
                    completion(.success(searchResult))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
