//
//  SearchBookListViewModel.swift
//  KTBooks
//
//  Created by pttem-ios on 1.10.2021.
//

import Foundation

/// SearchBookListViewModel
final class SearchBookListViewModel: SearchBookListViewModelProtocol {
    // MARK: - Private Properties.
    private var searchText: String = ""
    private var viewModels: [BookListItemViewModelProtocol]?
    private var filteredViewModels: [BookListItemViewModelProtocol]?
    private let service: BookListServiceProtocol
    // MARK: - Public Properties.
    var isSearchingEnabled: Bool {
        !searchText.isEmpty
    }
    // MARK: - Initializer Methods.
    init(service: BookListServiceProtocol) {
        self.service = service
    }
    /// Get Book List
    /// - Parameter completion: returns an error if it has
    func getBookList(completion: @escaping (Error?) -> Void) {
        service.getBookList { [weak self] result in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let response):
                self?.viewModels = response.results?.compactMap { BookListItemViewModel(response: $0) }
                completion(nil)
            }
        }
    }
    /// Filter Search
    /// - Parameters:
    ///   - text: Search Text
    ///   - completion: returns when did search
    func filterForSearchText(_ text: String, completion: () -> Void?) {
        self.searchText = text
        switch self.searchText.isEmpty {
        case true:
            self.filteredViewModels =  self.viewModels
        case false:
            self.filteredViewModels =  self.viewModels?.filter { $0.name!.contains(searchText) }
        }
        completion()
    }
    func numberOfSections() -> Int {
        1
    }
    func numberOfRowsInSecion(in section: Int) -> Int {
        isSearchingEnabled
            ? filteredViewModels?.count ?? 0
            : viewModels?.count ?? 0
    }
    func itemViewModel(at indexPath: IndexPath) -> BookListItemViewModelProtocol? {
        isSearchingEnabled
            ? filteredViewModels?[indexPath.item]
            : viewModels?[indexPath.item]
    }
}
