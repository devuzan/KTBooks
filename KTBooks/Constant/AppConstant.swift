//
//  AppConstant.swift
//  KTBooks
//
//  Created by pttem-ios on 28.09.2021.
//

import Foundation
import UIKit

enum AppConstants {
    enum Url {
        static let books = "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/100/non-explicit.json"
    }
    enum Text {
        static let errorTitle = "Error!"
    }
    enum Title {
        static let bookList = "Book List"
        static let searchBookList = "Search"
        static let favoriteBookList = "Favorite List"
    }
    enum StoryboardIdentifier {
        static let bookListNavigationController = "BookListNavigationController"
        static let searchBookListNavigationController = "SearchBookListNavigationController"
        static let favoriteBookListNavigationController = "FavoriteBookListNavigationController"
    }
    
    enum StoryboardName {
        static let bookList = "BookList"
        static let searchBookList = "SearchBookList"
        static let favoriteBookList = "FavoriteBookList"
    }
}


enum TabType {
    case bookList
    case searchBookList
    case favoriteBookList
    var title: String {
        switch self {
        case .bookList:
            return AppConstants.Title.bookList
        case .favoriteBookList:
            return AppConstants.Title.favoriteBookList
        case .searchBookList:
            return AppConstants.Title.searchBookList
        }
    }
    var identifier: String {
        switch self {
        case .bookList:
            return AppConstants.StoryboardIdentifier.bookListNavigationController
        case .favoriteBookList:
            return AppConstants.StoryboardIdentifier.favoriteBookListNavigationController
        case .searchBookList:
            return AppConstants.StoryboardIdentifier.searchBookListNavigationController
        }
        
    }
    var name: String {
        switch self {
        case .bookList:
            return AppConstants.StoryboardName.bookList
        case .favoriteBookList:
            return AppConstants.StoryboardName.favoriteBookList
        case .searchBookList:
            return AppConstants.StoryboardName.searchBookList
        }
    }
    var viewController: UIViewController {
        switch self {
        case .bookList:
            return BookListViewController.build()
        case .favoriteBookList:
            return FavoriteBookListViewController.build()
        case .searchBookList:
            return SearchBookListViewController.build()
        }
    }
}
