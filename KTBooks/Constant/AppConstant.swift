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
        static let orderType = "Select Order Type"
        static let cancel = "Cancel"
        static let ok = "OK"
    }
    enum Message {
        static let orderType = "Please choose an order type"
    }
    enum NavigationIdentifier {
        static let bookListNavigationController = "BookListNavigationController"
        static let searchBookListNavigationController = "SearchBookListNavigationController"
    }
    
    enum ViewControllerIdentifier {
        static let bookListViewController = "BookListViewController"
        static let searchBookListController = "SearchBookListViewController"
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
