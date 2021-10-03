//
//  TabBarController.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import UIKit

extension UINavigationController {
    static func build(tabType: TabType) -> UINavigationController {
        let sb = UIStoryboard(name: tabType.name, bundle: nil)
        let navigationController = sb.instantiateViewController(identifier: tabType.identifier) as! UINavigationController
        navigationController.tabBarItem.title = tabType.title
        navigationController.viewControllers = [tabType.viewController]
        return navigationController
    }
}

/// TabBarController
final class TabBarController: UITabBarController {
    // MARK: - Public Properties.
    var bookListNavigationController: UINavigationController {
        UINavigationController.build(tabType: .bookList)
    }
    var searchBookListNavigationController: UINavigationController {
        UINavigationController.build(tabType: .searchBookList)
    }
    var favoriteBookListNavigationController: UINavigationController {
        UINavigationController.build(tabType: .favoriteBookList)
    }

    // MARK: - View LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [bookListNavigationController, searchBookListNavigationController, favoriteBookListNavigationController]
    }
}

extension TabBarController {
    static func build() -> TabBarController {
        return TabBarController()
    }
}
