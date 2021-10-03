//
//  UserDefault+Favorite.swift
//  KTBooks
//
//  Created by pttem-ios on 4.10.2021.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let bookId = "bookId"
    }
    static func isFavoritedBook(id: String) -> Bool {
        UserDefaults.standard.bool(forKey: id)
    }
    static func updateFavoriteBookStatus(status: Bool, id: String) {
        UserDefaults.standard.setValue(status, forKey: id)
    }
}
