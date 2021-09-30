//
//  BookListCommonProtocols.swift
//  KTBooks
//
//  Created by pttem-ios on 30.09.2021.
//

import Foundation

protocol BookListItemViewModelProtocol {
    var id: String? { get }
    var name: String? { get }
    var artwork: URL? { get }
    var releaseDate: String? { get }
}
