////
////  App.swift
////  FinalProject
////
////  Created by Bien Le Q. on 8/26/19.
////  Copyright © 2019 Asiantech. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//final class Api {
//
//    struct Path {
//        static let baseURL = "https://www.googleapis.com/youtube/v3/" + "search?pageToken=CBkQAA&part=snippet&maxResults=25&order=relevance&q=lactroi&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
//    }
//}
//
//protocol URLStringConvertible {
//    var urlString: String { get }
//}
//
//protocol ApiPath: URLStringConvertible {
//    static var path: String { get }
//}
//
//private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
//    return lhs.urlString + "/" + rhs.urlString
//}
//
//extension String: URLStringConvertible {
//    var urlString: String { return self }
//}
//
//private func / (left: String, right: Int) -> String {
//    return left.appending(path: "\(right)")
//}
