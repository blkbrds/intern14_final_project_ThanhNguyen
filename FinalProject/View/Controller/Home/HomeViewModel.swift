//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by PCI0008 on 8/30/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import SwiftUtils

final class HomeViewModel {

    // MARK: Propeties
    var channel: [String] = ["123","456","789"]

    enum SectionType: Int, CaseIterable {
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
                 return "Nhac xuan"
            case .nhacVang:
                return "Nhac vang"
            case .channel:
                return "Channel"
            }
        }
    }

    // MARK: - Public func
    func numberOfSection() -> Int {
        return SectionType.allCases.count
    }

    func numberOfRowInSection(in section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending, .bolero, .nhacVang, .nhacXuan:
            return 1
        default:
            return channel.count
        }
    }

    func getChannelCellModel(at indexPath: IndexPath) -> ChannelCellViewModel {
        return ChannelCellViewModel(image: #imageLiteral(resourceName: "ic-jupiter"),
                                    channelName: "adfsdf",
                                    channelDescriptionText: "asdfasdf")
    }

    func heightForRowAt(at indexPath: IndexPath) -> CGFloat {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return 0 }
        switch sectionType {
        case .trending:
            return 200
        case .channel:
            return 100
        default:
            return 80
        }
    }

    func heightForHeaderInSection(at section: Int) -> CGFloat {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .trending:
            return 0
        default:
            return 20
        }
    }
}
