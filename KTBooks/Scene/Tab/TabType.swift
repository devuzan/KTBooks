//
//  TabType.swift
//  KTBooks
//
//  Created by pttem-ios on 4.10.2021.
//

import UIKit

enum TabType {
    /// Case List
    case bookList
    case searchBookList
    /// Title
    var title: String {
        switch self {
        case .bookList:
            return AppConstants.Title.bookList
        case .searchBookList:
            return AppConstants.Title.searchBookList
        }
    }
    /// Nabigation Ientitier
    var identifier: String {
        switch self {
        case .bookList:
            return AppConstants.NavigationIdentifier.bookListNavigationController
        case .searchBookList:
            return AppConstants.NavigationIdentifier.searchBookListNavigationController
        }
        
    }
    /// Stroyboard Name
    var name: String {
        switch self {
        case .bookList:
            return AppConstants.StoryboardName.bookList
        case .searchBookList:
            return AppConstants.StoryboardName.searchBookList
        }
    }
    /// View Controller
    var viewController: UIViewController {
        switch self {
        case .bookList:
            return BookListViewController.build()
        case .searchBookList:
            return SearchBookListViewController.build()
        }
    }
    /// TabBar image
    var image: UIImage? {
        switch self {
        case .bookList:
            return UIImage(named: "ICON-books")
        case .searchBookList:
            return UIImage(named: "ICON-search")
        }
    }
}
