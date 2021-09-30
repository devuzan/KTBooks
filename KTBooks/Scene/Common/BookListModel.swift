//
//  BookListModel.swift
//  KTBooks
//
//  Created by pttem-ios on 30.09.2021.
//

import Foundation

/// BookListServiceRawResponse
final class BookListServiceRawResponse: Decodable {
    final class Feed: Decodable {
        // MARK: - Public Properties.
        let results: [BookListItemServiceResponse]?
    }
    // MARK: - Public Properties.
    let feed: Feed?
}

/// BookListServiceResponse
final class BookListServiceResponse: Decodable {
    // MARK: - Public Properties.
    let results: [BookListItemServiceResponse]?
    // MARK: - Initializer Methods.
    init(from decoder: Decoder) throws {
        let rawResponse = try BookListServiceRawResponse(from: decoder)
        results = rawResponse.feed?.results
    }
}

/// BookListItemServiceResponse
final class BookListItemServiceResponse: Decodable {
    // MARK: - Public Properties.
    let id: String?
    let artworkUrl100: URL?
    let artistName: String?
    let name: String?
    let releaseDate: String?
}
