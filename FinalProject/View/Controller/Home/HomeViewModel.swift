//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {

    var channel: [String] = ["123","456","789"]

    enum Section: Int, CaseIterable {
        case trending
        case bolero
        case nhacXuan
        case nhacVang
        case channel

        var title: String {
            switch self {
            case .trending:
                return ""
            case .bolero:
                return "Bolero"
            case .nhacXuan:
                 return "Xuan"
            case .nhacVang:
                return "nhac vang"
            case .channel:
                return "channel"
            }
        }
    }

    func numberOfSection() -> Int {
        return Section.allCases.count
    }

    func numberOfRowInSection(in section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .trending, .bolero, .nhacVang, .nhacXuan:
            return 1
        default:
            return channel.count
        }
    }
    
    func heightForRowAt(at indexPath: IndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.row) else { return 0 }
        switch section {
        case .trending:
            return 200
        case .channel:
            return 120
        default:
            return 150
        }
    }
}
