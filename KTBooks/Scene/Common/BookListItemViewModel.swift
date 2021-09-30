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
    // MARK: - Private Properties.
    private let model: BookListItemServiceResponse
    // MARK: - Initializer Methods.
    init(response: BookListItemServiceResponse) {
        self.model = response
    }
}
