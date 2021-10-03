//
//  BookListCommonProtocols.swift
//  KTBooks
//
//  Created by pttem-ios on 30.09.2021.
//

import Foundation

/// BookListItemViewModelProtocol 
protocol BookListItemViewModelProtocol {
    var id: String? { get }
    var name: String? { get }
    var artwork: URL? { get }
    var releaseDate: String? { get }
    var artistName: String? { get }
    var imageName: String? { get }
    func updateFavoriteBook(isFavorited: Bool)
    func isFavoritedBook() -> Bool
}
