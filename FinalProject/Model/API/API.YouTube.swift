//
//  API.YouTube.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

extension APIManager.YouTube {
    struct QueryString {
        func getBot(pageToken: String, maxResults: Int, keyword: String) -> String {
            return APIManager.Path.baseURL + "pageToken=\(pageToken)&part=snippet&" + "maxResults=\(maxResults)&order=relevance&" + "q=\(keyword)&" + "key=\(APIManager.Path.key)-c"
        }
    }
    
    static func getBot(pageToken: String, maxResults: Int, keyword: String, completion: @escaping APICompletion<Dummy>) {
        let urlString = QueryString().getBot(pageToken: pageToken, maxResults: maxResults, keyword: keyword)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    guard let items = json["items"] as? [[String: Any]], let token = json["nextPageToken"] as? String else { return }
                    
                    var videos = [YouTube]()
                    
                    for item in items {
                        guard let snippet = item["snippet"] as? [String: Any],
                            let publishedAt = snippet["publishedAt"] as? String,
                            let channelTitle = snippet["channelTitle"] as? String,
                            let titleVideo = snippet["title"] as? String,
                            let thumbnails = snippet["thumbnails"] as? [String: Any],
                            let medium = thumbnails["medium"] as? [String: Any],
                            let imageStr = medium["url"] as? String else { return }
                        let youtube = YouTube(titleVideo: titleVideo, thumbnail: nil, publishedAt: publishedAt, channelTitle: channelTitle, imageStr: imageStr)
                        videos.append(youtube)
                    }
                    let dummy = Dummy(token: token, video: videos)
                    completion(.success(dummy))
                } else {
                    completion(.failure(.error("Data is not value")))
                }
            }
        }
    }
}
