//
//  TabBarController.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import UIKit

/// TabBarController
final class TabBarController: UITabBarController {
    // MARK: - Public Properties.
    var bookListNavigationController: UINavigationController {
        UINavigationController.build(tabType: .bookList)
    }
    var searchBookListNavigationController: UINavigationController {
        UINavigationController.build(tabType: .searchBookList)
    }
    // MARK: - View LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [bookListNavigationController, searchBookListNavigationController]
    }
}

// MARK: - Build
extension TabBarController {
    static func build() -> TabBarController {
        return TabBarController()
    }
}
