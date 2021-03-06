//
//  MainViewModel.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import Foundation

/// MainViewModel
final class BookListViewModel: BookListViewModelProtocol {
    // MARK: - Private Properties.
    private var sortingType = BookListSortingType.all
    private var sortedViewModels: [BookListItemViewModelProtocol]?
    private var viewModels: [BookListItemViewModelProtocol]?
    private let service: BookListServiceProtocol
    // MARK: - Initializer Methods.
    init(service: BookListServiceProtocol) {
        self.service = service
    }
    ///Get All Book List from Web Service
    func getBookList(completion: @escaping (Error?) -> Void) {
        service.getBookList { [weak self] result in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let response):
                self?.viewModels = response.results?.compactMap { BookListItemViewModel(response: $0) }
                self?.sortedViewModels = self?.viewModels
                completion(nil)
            }
        }
    }
    func numberOfSections() -> Int {
        1
    }
    func numberOfRowsInSecion(in section: Int) -> Int {
        sortedViewModels?.count ?? 0
    }
    func itemViewModel(at indexPath: IndexPath) -> BookListItemViewModelProtocol? {
        sortedViewModels?[indexPath.item]
    }
    func sorting(type: BookListSortingType, completion: () -> Void) {
        switch type {
        case .all:
            sortedViewModels = viewModels
        case .ascDate:
            sortedViewModels = viewModels?.sorted { $0.releaseDate ?? "" > $1.releaseDate  ?? "" }
        case .descDate:
            sortedViewModels = viewModels?.sorted { $0.releaseDate ?? "" < $1.releaseDate  ?? "" }
        case .favorited:
            sortedViewModels = viewModels?.filter { $0.isFavoritedBook() }
        }
        completion()
    }
}
