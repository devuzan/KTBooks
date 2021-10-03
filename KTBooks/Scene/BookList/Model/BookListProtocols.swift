//
//  BookListProtocols.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import Foundation


protocol BookListViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSecion(in section: Int) -> Int
    func itemViewModel(at indexPath: IndexPath) -> BookListItemViewModelProtocol?
    func getBookList(completion: @escaping (Error?) -> Void)
    func sorting(type: BookListSortingType, completion: () -> Void)
}

protocol BookListServiceProtocol {
    func getBookList(completion: @escaping (Result<BookListServiceResponse, NetworkError>) -> Void)
}
