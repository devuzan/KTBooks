//
//  BookListSortingType.swift
//  KTBooks
//
//  Created by pttem-ios on 3.10.2021.
//

import Foundation

enum BookListSortingType: String, CaseIterable {
    // MARK: - All Cases
    case all
    case ascDate
    case descDate
    case favorited
    // MARK: - Initializer Methods.
    init?(_ value: String) {
        switch value {
        case AppConstants.Text.orderAll: self = .all
        case AppConstants.Text.orderAsc: self = .ascDate
        case AppConstants.Text.orderDesc: self = .descDate
        case AppConstants.Text.orderFavorited: self = .favorited
        default: return nil
        }
    }
    var title: String {
        switch self {
        case .all:
            return AppConstants.Text.orderAll
        case .ascDate:
            return AppConstants.Text.orderAsc
        case .descDate:
            return AppConstants.Text.orderDesc
        case .favorited:
            return AppConstants.Text.orderFavorited
        }
    }
}
