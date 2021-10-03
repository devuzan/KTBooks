//
//  BookListItemViewModel.swift
//  KTBooks
//
//  Created by pttem-ios on 30.09.2021.
//

import Foundation

final class BookListItemViewModel: BookListItemViewModelProtocol {
    // MARK: - Public Properties.
    var id: String? {
        model.id
    }
    var name: String? {
        model.name
    }
    var artwork: URL? {
        model.artworkUrl100
    }
    var releaseDate: String? {
        model.releaseDate
    }
    var artistName: String? {
        model.artistName
    }
    var imageName: String? {
        isFavoritedBook() ? "ICON-favorited" : "ICON-favorite"
    }
    // MARK: - Private Properties.
    private let model: BookListItemServiceResponse
    // MARK: - Initializer Methods.
    init(response: BookListItemServiceResponse) {
        self.model = response
    }
    func updateFavoriteBook(isFavorited: Bool) {
        if let id = id {
            UserDefaults.updateFavoriteBookStatus(status: isFavorited, id: id)
        }
    }
    func isFavoritedBook() -> Bool {
        if let id = id {
            return UserDefaults.isFavoritedBook(id: id)
        }
        return false
    }
}
