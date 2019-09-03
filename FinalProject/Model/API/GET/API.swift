//
//  API.swift
//  FinalProject
//
//  Created by PCI0008 on 9/3/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

//Defines
enum APIError: Error {
    case error(String)
    case errorURL

    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error"
        }
    }
}

typealias APICompletion<T> = (Result<T, APIError>) -> Void

enum APIResult {
    case success(Data?)
    case failure(APIError)
}

struct API {
    //singleton
    private static var sharedAPI: API = {
        let sharedAPI = API()
        return sharedAPI
    }()

    static func shared() -> API {
        return sharedAPI
    }

    //init
    private init() {}
}
