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
        static let orderAll = "Tumu"
        static let orderAsc = "Yeniden Eskiye"
        static let orderDesc = "Eskiden Yeniye"
        static let orderFavorited = "Favoriler"
    }
    enum Title {
        static let bookList = "Book List"
        static let searchBookList = "Search"
    }
    enum StoryboardIdentifier {
        static let bookListNavigationController = "BookListNavigationController"
        static let searchBookListNavigationController = "SearchBookListNavigationController"
    }
    
    enum StoryboardName {
        static let bookList = "BookList"
        static let searchBookList = "SearchBookList"
    }
    enum Padding {
        static let mini: CGFloat = 4.0
        static let small: CGFloat = 8.0
        static let medium: CGFloat = 16.0
    }
}


enum TabType {
    case bookList
    case searchBookList
    var title: String {
        switch self {
        case .bookList:
            return AppConstants.Title.bookList
        case .searchBookList:
            return AppConstants.Title.searchBookList
        }
    }
    var identifier: String {
        switch self {
        case .bookList:
            return AppConstants.StoryboardIdentifier.bookListNavigationController
        case .searchBookList:
            return AppConstants.StoryboardIdentifier.searchBookListNavigationController
        }
        
    }
    var name: String {
        switch self {
        case .bookList:
            return AppConstants.StoryboardName.bookList
        case .searchBookList:
            return AppConstants.StoryboardName.searchBookList
        }
    }
    var viewController: UIViewController {
        switch self {
        case .bookList:
            return BookListViewController.build()
        case .searchBookList:
            return SearchBookListViewController.build()
        }
    }
}
