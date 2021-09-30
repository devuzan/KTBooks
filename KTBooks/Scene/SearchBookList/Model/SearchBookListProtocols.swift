//
//  SearchBookListProtocols.swift
//  KTBooks
//
//  Created by pttem-ios on 1.10.2021.
//

import Foundation

protocol SearchBookListViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSecion(in section: Int) -> Int
    func itemViewModel(at indexPath: IndexPath) -> BookListItemViewModelProtocol?
    func getBookList(completion: @escaping (Error?) -> Void)
    func filterForSearchText(_ text: String, completion: () -> Void?)
}
